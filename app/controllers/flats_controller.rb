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
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def add_picture_to_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :price, :currency)
  end
end
