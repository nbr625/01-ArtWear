require 'spec_helper'
require 'rails_helper'

describe PledgesController do
	describe "GET #new" do

		it "renders the new view" do
			get :new
			response.should render_template :new
		end


	end

	describe "POST #create" do

		context "with attributes within parameters" do
			it "saves the pledge in the database" do
				expect{
					post :create, pledge: build.attributes_for(:pledge)
				}.to change(pledge,:count).by(1)
			end
			it "redirect to the pledge index template" do
				post :create, pledge: build.attributes_for(:pledge)
				response.should redirect_to pledge.last
			end
		end

		context "with invalid attributes" do
			it "does not save the new pledge to the database" do
				expect{
					post :create, pledge: build.attributes_for(:invalid_pledge)
				}.to_not change(pledge, :pledge)
			end
			it "re-renders the :new template" do
				post :create, pledge: build.attributes_for(:invalid_pledge)
				response.should render_template :new
			end
		end
	end


end