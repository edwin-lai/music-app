class AlbumsController < ApplicationController
  def show
    render :show
  end

  def new
    render :new
  end

  def edit
    @album = Album.find_by_id(params[:id])
    render :edit
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def update
    @album = Album.find_by_id(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by_id(params[:id])
    @album.destroy unless @album.nil?
  end

  private

  def album_params
    params.require(:album).permit(:name, :album_id, :live_or_studio)
  end
end
