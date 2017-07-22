class WorkInfosController < ApplicationController
  before_action :find_word_info, only: %i[show edit update destroy entries update_items]

  respond_to :html, :json

  def index
    @word_infos = WorkInfo.all.order('sort_order ASC').order('name ASC')
    respond_with(@word_infos)
  end

  def new
    @word_info = WorkInfo.new
    respond_with(@word_info)
  end

  def show
    respond_with(@word_info)
  end

  def edit
    respond_with(@word_info)
  end

  def update
    if @word_info.update(group_params)
      render json: { post: @word_info,
                     msg: 'Work info successfully updated',
                     redirect_to: 'word_infos_path' }
    else
      render json: { errors: @word_info.errors,
                     msg: @word_info.errors.full_messages.join(', ') },
             status: 422
    end
  end

  def destroy
    @word_info.destroy
    render json: { msg: 'Work info successfully deleted',
                   redirect_to: 'word_infos_path' }
  end

  def create
    @word_info = WorkInfo.new(group_params)
    if @word_info.save
      render json: { post: @word_info, msg: 'Work info was created successfully.',
                     redirect_to: 'word_infos_path' }
    else
      render json: { errors: @word_info.errors,
                     msg: @word_info.errors.full_messages.join(', ') },
             status: 422
    end
  end

  private

  def find_word_info
    @word_info = WorkInfo.find(params[:id])
  end

  def group_params
    params.require(:word_info).permit(:id, :name, :amount, :units, :price)
  end
end