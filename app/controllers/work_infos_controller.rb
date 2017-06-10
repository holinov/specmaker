class WorkInfosController < ApplicationController
  before_action :set_work_info, only: [:show, :edit, :update, :destroy]

  # GET /work_infos
  # GET /work_infos.json
  def index
    @work_infos = WorkInfo.all
  end

  # GET /work_infos/1
  # GET /work_infos/1.json
  def show
  end

  # GET /work_infos/new
  def new
    @work_info = WorkInfo.new
  end

  # GET /work_infos/1/edit
  def edit
  end

  # POST /work_infos
  # POST /work_infos.json
  def create
    @work_info = WorkInfo.new(work_info_params)

    respond_to do |format|
      if @work_info.save
        format.html { redirect_to @work_info, notice: 'Work info was successfully created.' }
        format.json { render :show, status: :created, location: @work_info }
      else
        format.html { render :new }
        format.json { render json: @work_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_infos/1
  # PATCH/PUT /work_infos/1.json
  def update
    respond_to do |format|
      if @work_info.update(work_info_params)
        format.html { redirect_to @work_info, notice: 'Work info was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_info }
      else
        format.html { render :edit }
        format.json { render json: @work_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_infos/1
  # DELETE /work_infos/1.json
  def destroy
    @work_info.destroy
    respond_to do |format|
      format.html { redirect_to work_infos_url, notice: 'Work info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_info
      @work_info = WorkInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_info_params
      params.require(:work_info).permit(:name, :amount, :units, :price, :entry_info_id)
    end
end
