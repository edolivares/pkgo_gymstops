class GeoElementosController < ApplicationController
  before_action :set_geo_elemento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /geo_elementos
  # GET /geo_elementos.json
  def index
    @geo_elementos = GeoElemento.all
  end

  # GET /geo_elementos/1
  # GET /geo_elementos/1.json
  def show
  end

  # GET /geo_elementos/new
  def new
    @geo_elemento = GeoElemento.new
  end

  # GET /geo_elementos/1/edit
  def edit
  end

  # POST /geo_elementos
  # POST /geo_elementos.json
  def create
    @geo_elemento = GeoElemento.new(geo_elemento_params)

    respond_to do |format|
      if @geo_elemento.save
        format.html { redirect_to @geo_elemento, notice: 'Geo elemento was successfully created.' }
        format.json { render :show, status: :created, location: @geo_elemento }
      else
        format.html { render :new }
        format.json { render json: @geo_elemento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geo_elementos/1
  # PATCH/PUT /geo_elementos/1.json
  def update
    respond_to do |format|
      if @geo_elemento.update(geo_elemento_params)
        format.html { redirect_to @geo_elemento, notice: 'Geo elemento was successfully updated.' }
        format.json { render :show, status: :ok, location: @geo_elemento }
      else
        format.html { render :edit }
        format.json { render json: @geo_elemento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geo_elementos/1
  # DELETE /geo_elementos/1.json
  def destroy
    @geo_elemento.destroy
    respond_to do |format|
      format.html { redirect_to geo_elementos_url, notice: 'Geo elemento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geo_elemento
      @geo_elemento = GeoElemento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geo_elemento_params
      params.require(:geo_elemento).permit(:name, :latitude, :longitude, :tipo, :votes)
    end
end
