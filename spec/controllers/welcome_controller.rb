require 'spec_helper'
require 'rails_helper'
describe WelcomeController do
	describe "GET #index" do

		it "renders the index view" do
			get :index
			response.should render_template :index
		end
	end
end