require 'spec_helper'

describe CartController do
	describe "GET #show" do

		it "renders the show view" do
			get :show
			response.should render_template :show
		end
		
	end
end