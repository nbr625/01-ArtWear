class WelcomeController < ApplicationController
  def index
  	@products = Product.all
  	@prints = Print.all
  end
end
