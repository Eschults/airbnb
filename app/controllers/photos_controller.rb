class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @flat = set_flat
    @photo.flat = @flat
    if @photo.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @photo.destroy
    redirect_to flat_path(@flat)
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:url)
  end
end
