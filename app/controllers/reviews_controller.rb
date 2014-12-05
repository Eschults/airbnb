class ReviewsController < ApplicationController
before_action :set_flat

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.flat = @flat
    @review.user = current_user
    if @review.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

end
