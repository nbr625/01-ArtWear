class UsersController < ApplicationController
#before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @products = Product.all
    @user_products = @products.where(creator: @user.username)

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end

end
