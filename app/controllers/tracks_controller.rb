class TracksController < ApplicationController
  def show
    render :show
  end

  def new
    render :new
  end

  def edit
    @track = Track.find_by_id(params[:id])
    render :edit
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def update
    @track = Track.find_by_id(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find_by_id(params[:id])
    @track.destroy unless @track.nil?
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :regular_or_bonus)
  end
end
