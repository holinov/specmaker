class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show edit update destroy entries update_items]

  respond_to :html, :json

  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def show
    respond_with(@project)
  end

  def entries
    respond_with(@project.entries
                   .map { |e| { id: e.entry_info_id, desc: e.render, amount: e.amount } })
  end

  def selectable_entries
    ids = []
    if params[:id]
      find_project
      ids = @project.entry_infos.map(&:id)
    end
    search_text = params[:query]
    ids += params[:selected].map(&:to_i) if params[:selected].present?
    ids.uniq!
    query = (ids.empty? ? EntryInfo.all : EntryInfo.where('id NOT IN (?)', ids))
            .map { |e| { id: e.id, desc: e.render } }
    query.select! { |i| i[:desc].include? search_text } if search_text.present?

    respond_with(query)
  end

  def edit
    respond_with(@project)
  end

  def update_items
    project_entries = @project.entries.map(&:entry_info_id)
    items = params[:items]
    items.each do |item|
      if project_entries.include? item['id']
        entry = @project.entries.where('entry_info_id = ?', item['id']).first
        entry.amount = item['amount']
        entry.save!
      else
        Entry.create!(project: @project, entry_info: EntryInfo.find(item['id']), amount: item['amount'])
      end
    end
    new_items = items.map { |item| item['id'] }
    @project.entries.each do |entry|
      entry.destroy! unless new_items.include? entry.entry_info_id
    end
  end

  def update
    if @project.update(group_params)
      render json: { post: @project,
                     msg: 'Project successfully updated',
                     redirect_to: 'projects_path' }
    else
      render json: { errors: @project.errors,
                     msg: @project.errors.full_messages.join(', ') },
             status: 422
    end
  end

  def destroy
    @project.destroy
    render json: { msg: 'Project successfully deleted' }
  end

  def create
    @project = Project.new(group_params)
    if @project.save
      render json: { post: @project, msg: 'Project was created successfully.',
                     redirect_to: 'projects_path' }
    else
      render json: { errors: @project.errors,
                     msg: @project.errors.full_messages.join(', ') },
             status: 422
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def group_params
    params.require(:project).permit(:id, :name, :desc)
  end
end