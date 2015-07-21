class AdminController < ApplicationController
	before_action :authenticate_user!
  def main
  	@subproducts = Subproduct.all
  	@prints = Print.all
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end
end
