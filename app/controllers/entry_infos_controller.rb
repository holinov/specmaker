class EntryInfosController < ApplicationController
  before_action :find_entry_info, only: %i[show edit update destroy entries update_items]

  respond_to :html, :json

  def index
    @entry_infos = EntryInfo.all.order('name ASC')
    respond_with(@entry_infos)
  end

  def new
    @entry_info = EntryInfo.new
    respond_with(@entry_info)
  end

  def show
    respond_with(@entry_info)
  end

  def edit
    respond_with(@entry_info)
  end

  def update
    if @entry_info.update(group_params)
      render json: { post: @entry_info,
                     msg: 'Entry info successfully updated',
                     redirect_to: 'entry_infos_path' }
    else
      render json: { errors: @entry_info.errors,
                     msg: @entry_info.errors.full_messages.join(', ') },
             status: 422
    end
  end

  def destroy
    @entry_info.destroy
    render json: { msg: 'Entry info successfully deleted',
                   redirect_to: 'entry_infos_path' }
  end

  def create
    @entry_info = EntryInfo.new(group_params)
    if @entry_info.save
      render json: { post: @entry_info,
                     msg: 'Entry info was created successfully.',
                     redirect_to: 'entry_infos_path' }
    else
      render json: { errors: @entry_info.errors,
                     msg: @entry_info.errors.full_messages.join(', ') },
             status: 422
    end
  end

  def selectable_entries
    ids = []
    if params[:id]
      find_entry_info
      ids = @entry_info.field_infos.map(&:id)
    end
    search_text = params[:query]
    ids += params[:selected].map(&:to_i) if params[:selected].present?
    ids.uniq!
    query = (ids.empty? ? FieldInfo.all : FieldInfo.where('id NOT IN (?)', ids))
            .order('sort_order ASC')
            .map { |e| { id: e.id, name: e.name, unit_name: e.unit_name } }
    search_text = search_text.to_s.strip
    query.select! { |i| i[:desc].include? search_text } if search_text.present?

    puts "#{ids}, #{search_text}"
    p query
    respond_with(query)
  end

  def update_items
    entry_fields = @entry_info.field_infos.map(&:field_info_id)
    items = params[:items]
    items.each do |item|
      if entry_fields.include? item['id']
        entry = @project.entries.where('entry_info_id = ?', item['id']).first
        entry.amount = item['amount']
        entry.save!
      else
        Field.create!(entry_info: @entry_info,
                      field_info: FieldInfo.find(item['id']),
                      amount: item['value'])
      end
    end
    new_items = items.map { |item| item['id'] }
    @entry_info.entries.each do |field|
      field.destroy! unless new_items.include? field.field_info_id
    end
  end

  private

  def find_entry_info
    @entry_info = EntryInfo.find(params[:id])
  end

  def group_params
    params.require(:entry_info).permit(:id, :name, :unit_name, :sort_order, :group_id)
  end
end