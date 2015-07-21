class AdminController < ApplicationController
	before_action :authenticate_user!
  def main

  	@prints = Print.all
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end
end
