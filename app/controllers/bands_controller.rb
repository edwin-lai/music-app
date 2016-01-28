class BandsController < ApplicationController
  def index
    render :index
  end

  def show
    render :show
  end

  def new
    render :new
  end

  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def update
    @band = Band.find_by_id(params[:id])
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    @band.destroy unless @band.nil?
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
