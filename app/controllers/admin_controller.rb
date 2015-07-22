class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin
  before_action :set_prints, except: [:flagged_comments, :out_of_stock]
	before_action :set_subproducts, only: [:main, :out_of_stock]
  before_action :set_reviews, only: [:main, :flagged_comments]
  attr_accessor(:main, :most_pledges, :best_rated, :flagged_comments, :flagged_prints, :out_of_stock)

private

  def set_prints
    @prints = Print.all
  end

  def set_subproducts
    @subproducts = Subproduct.all
  end

  def set_reviews
    @reviews = Review.all
  end
	
  def authenticate_admin
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end
end
