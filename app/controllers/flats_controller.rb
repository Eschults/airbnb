class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_flat, only: [:show, :edit, :update]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.owner = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @photo = Photo.new
    @photo.flat_id = @flat.id
    @photo.url = @flat.picture.url
    @photo.save
    @flat.photos << @photo
    if @flat.save
      redirect_to flat_path(@flat)
    else
      raise
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :price, :currency, photos_attributes: [:id, :picture, :url, :_destroy])
  end

  def photo_params
    params.require(:photo).permit(:flat, :url, :picture)
  end
end
