require 'spec_helper'
require 'rails_helper'

describe PrintsController, type: :controller do
	describe "GET #index" do
		it "iterates all then prints into an array" do
			get :index
			assigns(:prints).should eq(Print.all)
		end

		it "renders the index view" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		it "funnels the right print to the @print variable" do
			print = build(:print)
			get :show, id: print
			assigns(:print).should eq(print)
		end

		it "renders the :show template" do
			get :show, id: build(:print)
			response.should render_template :show
		end
		it "should redirect to root if the user is not signed in" do
			current_user = nil
			response.should redirect_to(root_url)
		end
	end

	describe "GET #new" do
		it "renders the :new template" do
			get :new, id: build(:print)
			response.should render_template :new
		end
		it "should redirect to root if the user is not signed in" do
			current_user = nil
			response.should redirect_to(root_url)
		end
	end

	describe "POST #create" do

		it "should redirect to root if the user is not signed in" do
			current_user = nil
			response.should redirect_to(root_url)
		end

		context "with attributes within parameters" do
			it "saves the print in the database" do
				expect{
					post :create, print: build.attributes_for(:print)
				}.to change(Print,:count).by(1)
			end
			it "redirect to the Print index template" do
				post :create, print: build.attributes_for(:print)
				response.should redirect_to Print.last
			end

		end

		context "with invalid attributes" do
			it "does not save the new print to the database" do
				expect{
					post :create, print: build.attributes_for(:invalid_print)
				}.to_not change(Print, :print)
			end
			it "re-renders the :new template" do
				post :create, print: build.attributes_for(:invalid_print)
				response.should render_template :new
			end
		end
	end

	describe "PUT #update" do

		before :each do
			@print = build(:print, name: "Magnus Opus", description: "My pride and joy.")
		end

		context "valid attributes" do
			it "located the requested @print" do
				put :update, id: @print, print: build.attributes_for(:print)
				assigns(:print).should eq(@print)
			end

			it "changes @print's attributes" do
				put :update, id: @print,
					print: build.attributes_for(:print, name: "Materpiece", description: "Wonderful.")
				@print.reload
				@print.name.should eq("Masterpiece")
				@print.description eq("Wonderful.")
			end

			it "redirect to the updated print" do
				put :update, id: @print, print: build.attributes_for(:print)
				response.should redirect_to @print
			end

		end

		context "invalid attributes" do

			it "located the appropiarte @print" do
				put :update, id: @print, print: build.attributes_for(:invalid_print)
				assigns(:print).should eq(@print)
			end

			it "does not change @print's attributes" do

				put :update, id: @print,
					print: build.attributes_for(:print, name: "Magnus Opus", description: nil)
				@print.reload
				@print.name.should_not eq("Magnus Opus")
				@print.description.should_not eq("My pride and joy.")
			end

			it "re-renders the edit method" do
				put :update, id: @print, print: build.attributes_for(:invalid_print)
				response.should render_template :edit
			end
		end		
	end

	describe 'Delete destroy' do

		before :each do
			@print = build(:print)
		end


		it "deletes the prints" do
			expect{
				delete :destroy, id: @print
			}.to change(Print, :count).by(-1)
		end

		it "redirects to prints#index" do
			delete :destroy, id: @print
			response.should redirect_to(prints_url)
		end
	end

end