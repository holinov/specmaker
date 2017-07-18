class FieldInfosController< ApplicationController
  before_action :find_field_info, only: %i[show edit update destroy entries update_items]

  respond_to :html, :json

  def index
    @field_infos = FieldInfo.all.order('sort_order ASC').order('name ASC')
    respond_with(@field_infos)
  end

  def new
    @field_info = FieldInfo.new
    respond_with(@field_info)
  end

  def show
    respond_with(@field_info)
  end

  def edit
    respond_with(@field_info)
  end

  def update
    if @field_info.update(group_params)
      render json: { post: @field_info,
                     msg: 'Field info successfully updated',
                     redirect_to: 'field_infos_path' }
    else
      render json: { errors: @field_info.errors,
                     msg: @field_info.errors.full_messages.join(', ') },
             status: 422
    end
  end

  def destroy
    @field_info.destroy
    render json: { msg: 'Field info successfully deleted',
                   redirect_to: 'field_infos_path' }
  end

  def create
    @field_info = FieldInfo.new(group_params)
    if @field_info.save
      render json: { post: @field_info, msg: 'Field info was created successfully.',
                     redirect_to: 'field_infos_path' }
    else
      render json: { errors: @field_info.errors,
                     msg: @field_info.errors.full_messages.join(', ') },
             status: 422
    end
  end

  private

  def find_field_info
    @field_info = FieldInfo.find(params[:id])
  end

  def group_params
    params.require(:field_info).permit(:id, :name, :unit_name, :sort_order)
  end
end