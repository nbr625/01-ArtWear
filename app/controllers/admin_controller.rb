class AdminController < ApplicationController
	before_action :authenticate_user!
  def main
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end
end
