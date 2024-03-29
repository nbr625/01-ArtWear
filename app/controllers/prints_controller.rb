class PrintsController < ApplicationController
  before_action :set_print, only: [:show, :edit, :update, :destroy, :flag, :turn_into_product]
  before_action :authenticate_user!, only: [:show, :new ]
  attr_accessor :edit
  


  def index
    @prints = Print.all
    @user = current_user
  end



  def show
    @reviews = Review.where(print_id: @print.id).order("created_at DESC")
  end


  def new
    @print = current_user.prints.build
  end

  # Turn a print, under review, into a product instance.
  def turn_into_product
    @product = Product.new(image: @print.image, name: @print.name, \
      description: @print.description, user_id: @print.user_id, print_id: @print.id, \
       creator: @print.user.username)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @print = current_user.prints.build(print_params)

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

  def flag
    @print.increment!(:flag_count)
    respond_to do |format|
      if @print.save
        format.html { redirect_to @print, notice: 'Print was successfully flagged.' }
        format.json { render :show, status: :created, location: @print }
      else
        format.html { render :new }
        format.json { render json: @print.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @print.update(print_params)
        format.html { redirect_to @print, notice: 'Print was successfully updated.' }
        format.json { render :show, status: :ok, location: @print }
      else
        format.html { render :edit }
        format.json { render json: @print.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @print.destroy
    respond_to do |format|
      format.html { redirect_to prints_url, notice: 'Print was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_print
      @print = Print.find(params[:id])
    end

    def print_params
      params.require(:print).permit(:name, :description, :rating, :category, :image, :average_review, :flag_count, :pledge_count)
    end
end
