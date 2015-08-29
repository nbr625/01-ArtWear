require 'spec_helper'

describe AdminController do
	describe "GET #main" do

		it "renders the main view if user is admin" do
			user = FactoryGirl.create(:user)
			get :main
			response.should render_template :main
		end

		it "should redirect to user to root if not admin" do
			user = FactoryGirl.create(user, admin: false)
			response.should redirect_to(root_url)
		end
		
	end

	describe "GET #most_pledges" do

		it "renders the most_pledges view if user is admin" do
			user = FactoryGirl.create(:user, admin: true)
			get :most_pledges
			response.should render_template :most_pledges
		end

		it "should redirect to user to root if not admin" do
			user = FactoryGirl.create(user, admin: false)
			response.should redirect_to(root_url)
		end
	end

	describe "GET #best_rated" do

		it "renders the best_rated view if user is admin" do
			user = FactoryGirl.create(:user, admin: true)
			get :most_pledges
			response.should render_template :most_pledges
		end

		it "should redirect to user to root if not admin" do
			user = FactoryGirl.create(user, admin: false)
			response.should redirect_to(root_url)
		end
	end

	describe "GET #flagged_comments" do

		it "renders the main view if user is admin" do
			user = FactoryGirl.create(:user, admin: true)
			get :flagged_comments
			response.should render_template :flagged_comments
		end

		it "should redirect to user to root if not admin" do
			user = FactoryGirl.create(user, admin: false)
			response.should redirect_to(root_url)
		end
	end

	describe "GET #flagged_prints" do

		it "renders the main view if user is admin" do
			user = FactoryGirl.create(:user, admin: true)
			get :flagged_prints
			response.should render_template :flagged_prints
		end

		it "should redirect to user to root if not admin" do
			user = FactoryGirl.create(user, admin: false)
			response.should redirect_to(root_url)
		end
	end

	describe "GET #out_of_stock" do

		it "renders the out_of_stock view if user is admin" do
			user = FactoryGirl.create(:user, admin: true)
			get :out_of_stock
			response.should render_template :out_of_stock
		end

		it "should redirect to user to root if not admin" do
			user = FactoryGirl.create(user, admin: false)
			response.should redirect_to(root_url)
		end
	end

	

end