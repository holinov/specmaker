class EntryInfosController < ApplicationController
  before_action :set_entry_info, only: [:show, :edit, :update, :destroy]

  # GET /entry_infos
  # GET /entry_infos.json
  def index
    @entry_infos = EntryInfo.all
  end

  # GET /entry_infos/1
  # GET /entry_infos/1.json
  def show
  end

  # GET /entry_infos/new
  def new
    @entry_info = EntryInfo.new
  end

  # GET /entry_infos/1/edit
  def edit
  end

  # POST /entry_infos
  # POST /entry_infos.json
  def create
    @entry_info = EntryInfo.new(entry_info_params)

    respond_to do |format|
      if @entry_info.save
        format.html { redirect_to @entry_info, notice: 'Entry info was successfully created.' }
        format.json { render :show, status: :created, location: @entry_info }
      else
        format.html { render :new }
        format.json { render json: @entry_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entry_infos/1
  # PATCH/PUT /entry_infos/1.json
  def update
    respond_to do |format|
      if @entry_info.update(entry_info_params)
        format.html { redirect_to @entry_info, notice: 'Entry info was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry_info }
      else
        format.html { render :edit }
        format.json { render json: @entry_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_infos/1
  # DELETE /entry_infos/1.json
  def destroy
    @entry_info.destroy
    respond_to do |format|
      format.html { redirect_to entry_infos_url, notice: 'Entry info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_info
      @entry_info = EntryInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_info_params
      params.require(:entry_info).permit(:group_id)
    end
end
