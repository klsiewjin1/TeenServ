# Handles review access
class ReviewsController < ApplicationController
  include ReviewsHelper
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reviewer_id = session[:user_id]
    @user = User.find_by(id: @review.reviewee_id)
    if @review.save
      flash[:notice] = 'Review was successfully created'
      redirect_to @user
    elsif @review.errors[:review].any?
      flash[:errors] = "review error"
      redirect_to @user
    elsif @review.errors[:rating].any?
      flash[:errors] = "rating error"
      redirect_to @user
    end  
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @user = User.find(session[:user_id])
    @review_match = get_user_reviews(@user.id)
    @rating = get_avg_rating(@user.id)
  end

  def show
    @review = Review.find(params[:id])
  end

  private
    def review_params
      params.require(:review).permit(:review, :rating, :reviewee_id, :reviewer_id)
    end
end
