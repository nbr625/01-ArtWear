require 'spec_helper'
require 'rails_helper'

describe CartsController do
	context "GET #show" do

		it "renders the show view" do
			get :show
			response.should render_template :show
		end
		
	end
end