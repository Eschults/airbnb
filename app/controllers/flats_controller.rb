class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_flat, only: [:show, :edit, :update]
  layout 'map', only: [:index]

  def index
    @flats = Flat.all
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      if flat.address
        marker.lat flat.address.latitude
        marker.lng flat.address.longitude
      end
    end
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
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :price, :currency, photos_attributes: [:picture, :_destroy], address_attributes: [:number, :street, :city, :zip_code])
  end
end
