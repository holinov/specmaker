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

  private

  def find_entry_info
    @entry_info = EntryInfo.find(params[:id])
  end

  def group_params
    params.require(:entry_info).permit(:id, :name, :unit_name, :sort_order)
  end
end