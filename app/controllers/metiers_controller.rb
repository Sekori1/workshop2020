class MetiersController < ApplicationController
  before_action :set_metier, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Metiers", :metiers_path
  
  # GET /metiers
  # GET /metiers.json
  def index
    @metiers = Metier.all
  end

  # GET /metiers/1
  # GET /metiers/1.json
  def show
    add_breadcrumb "#{@metier.name}", :metier_path
  end

  # GET /metiers/new
  def new
    @metier = Metier.new
  end

  # GET /metiers/1/edit
  def edit
  end

  # POST /metiers
  # POST /metiers.json
  def create
    @metier = Metier.new(metier_params)

    respond_to do |format|
      if @metier.save
        format.html { redirect_to @metier, notice: 'Metier was successfully created.' }
        format.json { render :show, status: :created, location: @metier }
      else
        format.html { render :new }
        format.json { render json: @metier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metiers/1
  # PATCH/PUT /metiers/1.json
  def update
    respond_to do |format|
      Rails.logger.info metier_params[:tool_ids]
      if @metier.update(metier_params)
        format.html { redirect_to @metier, notice: 'Metier was successfully updated.' }
        format.json { render :show, status: :ok, location: @metier }
      else
        format.html { render :edit }
        format.json { render json: @metier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metiers/1
  # DELETE /metiers/1.json
  def destroy
    @metier.destroy
    respond_to do |format|
      format.html { redirect_to metiers_url, notice: 'Metier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metier
      @metier = Metier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def metier_params
      params.require(:metier).permit(:name, :media, :training, :explanation, :tool_ids=> [])
    end
end
