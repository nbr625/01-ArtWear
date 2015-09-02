require 'spec_helper'
require 'rails_helper'


describe UsersController, type: :controller do


	describe "GET #show" do
		it "it funnels the right user to the @user variable" do 
			user = create(:user)
			get :show, id: user.id
			assigns(:user).should eq(user)
		end

		it "renders the :show template" do
			user = create(:user)
			visit user_path(user)
			response.should render_template :show
		end
	end

	describe "GET #new" do
		it "renders the :new template" do
			visit new_user_registration_path
			response.should be_success

		end
	end
	

end