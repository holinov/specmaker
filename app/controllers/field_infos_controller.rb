class FieldInfosController < ApplicationController
  before_action :set_field_info, only: [:show, :edit, :update, :destroy]

  # GET /field_infos
  # GET /field_infos.json
  def index
    @field_infos = FieldInfo.all
  end

  # GET /field_infos/1
  # GET /field_infos/1.json
  def show
  end

  # GET /field_infos/new
  def new
    @field_info = FieldInfo.new
  end

  # GET /field_infos/1/edit
  def edit
  end

  # POST /field_infos
  # POST /field_infos.json
  def create
    @field_info = FieldInfo.new(field_info_params)

    respond_to do |format|
      if @field_info.save
        format.html { redirect_to @field_info, notice: 'Field info was successfully created.' }
        format.json { render :show, status: :created, location: @field_info }
      else
        format.html { render :new }
        format.json { render json: @field_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_infos/1
  # PATCH/PUT /field_infos/1.json
  def update
    respond_to do |format|
      if @field_info.update(field_info_params)
        format.html { redirect_to @field_info, notice: 'Field info was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_info }
      else
        format.html { render :edit }
        format.json { render json: @field_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_infos/1
  # DELETE /field_infos/1.json
  def destroy
    @field_info.destroy
    respond_to do |format|
      format.html { redirect_to field_infos_url, notice: 'Field info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_info
      @field_info = FieldInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_info_params
      params.require(:field_info).permit(:name, :sort_order, :unit_name)
    end
end
