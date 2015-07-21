class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy, :flag]
  before_action :set_print
  before_action :authenticate_user!
  
  def new
    @review = current_user.reviews.build
  end

  def edit
  end

  def index
    @reviews = @print.reviews
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.user_id = current_user.id
    @review.print_id = @print.id

    if @review.save
      redirect_to @print
    else
      render 'new'
    end
  end

  def flag
    @review.flag_review
    respond_to do |format|
      if @print.save
        format.html { redirect_to @print, notice: 'Print was successfully created.' }
        format.json { render :show, status: :created, location: @print }
      else
        format.html { render :new }
        format.json { render json: @print.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @print, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @print.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    redirect_to @print
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def set_print
      @print = Print.find(params[:print_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment, :pledge, :flag_count)
    end
end
