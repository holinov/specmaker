class EntriesController < ApplicationController
  before_action :find_entry, only: %i[show edit update destroy]

  respond_to :html, :json

  def index
    @entrys = Entry.all
    respond_with(@entrys)
  end

  def new
    @entry = Entry.new
    respond_with(@entry)
  end

  def show
    respond_with(@entry)
  end

  def edit
    respond_with(@entry)
  end

  def update
    if @entry.update(group_params)
      render json: { post: @entry, msg: 'Group successfully updated',
                     redirect_to: 'entrys_path'}
    else
      render json: { errors: @entry.errors,
                     msg: @entry.errors.full_messages.join(', ') },
             status: 422
    end
  end

  def destroy
    @entry.destroy
    render json: {msg: 'Group successfully deleted'}
  end

  def create
    @entry = Entry.new(group_params)
    if @entry.save
      render json: { post: @entry, msg:'Project was created successfully.',
                     redirect_to: 'entrys_path'}
    else
      render json: { errors: @entry.errors,
                     msg: @entry.errors.full_messages.join(', ') },
             status: 422
    end
  end

  private

  def find_entry
    @entry = Entry.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:id, :name, :group_id)
  end
end