class SubproductsController < ApplicationController
  before_action :set_subproduct, only: [:show, :edit, :update, :destroy]
  

  def new
    @subproduct = Subproduct.new
  end

  def edit
  end

  def create
    @subproduct = Subproduct.new(subproduct_params)

    respond_to do |format|
      if @subproduct.save
        format.html { redirect_to @subproduct, notice: 'Subproduct was successfully created.' }
        format.json { render :show, status: :created, location: @subproduct }
      else
        format.html { render :new }
        format.json { render json: @subproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subproduct.update(subproduct_params)
        format.html { redirect_to @subproduct, notice: 'Subproduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @subproduct }
      else
        format.html { render :edit }
        format.json { render json: @subproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subproduct.destroy
    respond_to do |format|
      format.html { redirect_to subproducts_url, notice: 'Subproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_subproduct
      @subproduct = Subproduct.find(params[:id])
    end
    
    def subproduct_params
      params.require(:subproduct).permit(:price, :quantity, :size)
    end
end
