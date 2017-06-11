# class GroupsController < ApplicationController
#   respond_to :json
# end
class GroupsController < ApplicationController
  before_action :find_group, only: %i[show edit update destroy]

  respond_to :html, :json

  def selectable
    @selectable = Group.selectable
    respond_with(@selectable)
  end

  def index
    @groups = Group.all
    respond_with(@groups)
  end

  def new
    @group = Group.new()
    respond_with(@group)
  end

  def show
    respond_with(@group)
  end

  def edit
    respond_with(@group)
  end

  def update
    if @group.update(group_params)
      render json: { post: @group, msg: 'Group successfully updated', redirect_to: 'groups_path'}
    else
      render json: { errors: @group.errors, msg: @group.errors.full_messages.join(', ') }, status: 422
    end
  end

  def destroy
    @group.destroy
    render json: {msg: 'Group successfully deleted'}
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: { post: @group, msg:'Group was created successfully.', redirect_to: 'groups_path'}
    else
      render json: { errors: @group.errors, msg: @group.errors.full_messages.join(', ') }, status: 422
    end
  end

  private

  def find_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:id, :name, :group_id)
  end
end
