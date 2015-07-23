class WelcomeController < ApplicationController
  def index
  	@products = Product.recent
  	@prints = Print.all
  end
end
