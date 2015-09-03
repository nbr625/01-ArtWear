require 'spec_helper'
require 'rails_helper'

describe PledgesController do
	describe "GET #new" do



		it "renders the new view if user signed in" do
			@user = create(:user)
			sign_in @user
			@print = create(:print)
			visit new_print_pledge_path(@print)
			response.should be_success
		end


	end

	describe "POST #create" do

		before(:each)do
			sign_in create(:user)
			@print = create(:print)
		end

		context "with attributes within parameters" do
			it "saves the pledge in the database" do
				expect{
					@pledge_attributes = attributes_for(:pledge, print_id: @print.id)
					post :create, print_id: @print.id, pledge: @pledge_attributes
				}.to change(Pledge, :count).by(1)
			end
			it "redirect to the pledge index template" do
				@pledge_attributes = attributes_for(:pledge, print_id: @print.id)
				post :create, print_id: @print.id, pledge: @pledge_attributes
				response.should redirect_to print_path(@print)
			end
		end

		context "with invalid attributes" do
			it "to not save the pledge in the database" do
				expect{
					@pledge_attributes = attributes_for(:pledge, print_id: @print.id, agreement: nil)
					post :create, print_id: @print.id, pledge: @pledge_attributes
				}.to_not change(Pledge, :count)
			end
			it "redirect to the pledge index template" do
				@pledge_attributes = attributes_for(:pledge, print_id: @print.id, agreement: nil)
				post :create, print_id: @print.id, pledge: @pledge_attributes
				response.should render_template :new
			end
		end
	end


end