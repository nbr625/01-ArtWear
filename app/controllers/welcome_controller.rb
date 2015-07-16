class WelcomeController < ApplicationController
  def index
  	@products = Product.recent
  end
end
