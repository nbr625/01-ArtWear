class SubproductsController < ApplicationController
  before_action :set_subproduct, except: [:create]
  before_action :set_product




  def create
    @subproduct = @product.subproducts.create(subproduct_params)

    respond_to do |format|
      if @subproduct.save
        format.html { redirect_to product_path(@product), notice: 'Subproduct was successfully created.' }
        format.json { render :show, status: :created, location: @subproduct }
      else
        format.html { render :new }
        format.json { render json: @subproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @subproduct.update(subproduct_params)
        format.html { redirect_to product_path(@product), notice: 'Subproduct was successfully updated.' }
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
      format.html { redirect_to product_path(@product), notice: 'Subproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
    def set_product
      @product = Product.find(params[:product_id])
    end
  
    def set_subproduct
      @subproduct = Subproduct.find(params[:id])
    end
    
    def subproduct_params
      params.require(:subproduct).permit(:price, :quantity, :size, :name)
    end
end
