class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin
	

  def main
    @prints = Print.all
    @subproducts = Subproduct.all
    @reviews = Review.all
  end

  def best_rated
    @prints = Print.all
  end

  def flagged_comments
    @reviews = Review.all
  end

  def flagged_prints
    @prints = Print.all
  end

  def out_of_stock
    @subproducts = Subproduct.all
  end

private
	
  def authenticate_admin
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end
end
