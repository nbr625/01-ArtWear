require 'spec_helper'
require 'rails_helper'

describe PrintsController, type: :controller do
	describe "GET #index" do
		before(:each) do 
			@print1 = create(:print)
			@print2 = create(:print)
		end
		it "iterates all then prints into an array" do
			get :index
			[@print1, @print2].should eq(Print.all)
		end

		it "renders the index view" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		it "funnels the right print to the @print variable" do
			sign_in create(:user)
			print = create(:print)
			get :show, id: print.id
			assigns(:print).should eq(print)
		end

		it "renders the :show template" do
			sign_in create(:user)
			print = create(:print)
			get :show, id: print.id
			response.should render_template :show
		end
		it "should redirect to root if the user is not signed in" do
			print = create(:print)
			get :show, id: print.id
			response.should redirect_to(new_user_session_path)
		end
	end

	describe "GET #new" do
		it "renders the :new template" do
			sign_in create(:user)
			get :new
			response.should render_template :new
		end
		it "should redirect to sign in if the user is not signed in" do
			get :new
			response.should redirect_to(new_user_session_path)
		end
	end

	describe "POST #create" do

		context "with attributes within parameters" do
			it "saves the print in the database" do
				sign_in create(:user)
				expect{
					post :create, print: attributes_for(:print)
				}.to change(Print,:count).by(1)
			end
			it "redirect to the Print index template" do
				sign_in create(:user)
				post :create, print: attributes_for(:print)
				response.should redirect_to(print_path(Print.last))
			end

		end

		context "with invalid attributes" do
			it "does not save the new print to the database" do
				sign_in create(:user)
				expect{
					post :create, print: attributes_for(:print, name: nil)
				}.to_not change(Print, :count)
			end
			it "re-renders the :new template" do
				sign_in create(:user)
				post :create, print: attributes_for(:print, name: nil)
				response.should render_template :new
			end
		end
	end

	describe "PUT #update" do
		before :each do
			sign_in create(:user)
			@print = create(:print, name: "Something Random", description: "Something Descriptive")
		end

		context "valid attributes" do

			

			it "located the requested @print" do
				put :update, id: @print.id, print: attributes_for(:print)
				assigns(:print).should eq(@print)
			end

			it "changes @print's attributes" do
				put :update, id: @print.id,
					print: attributes_for(:print, name: "Masterpiece", description: "Wonderful.")
				@print.reload
				@print.name.should eq("Masterpiece")
				@print.description.should eq("Wonderful.")
			end

			it "redirect to the updated print" do
				put :update, id: @print.id, print: attributes_for(:print)
				response.should redirect_to print_path(@print)
			end

		end

		context "invalid attributes" do

			it "located the requested @print" do
				put :update, id: @print.id, print: attributes_for(:print)
				assigns(:print).should eq(@print)
			end

			it "does not change @print's attributes" do

				put :update, id: @print.id,
					print: attributes_for(:print, name: "Masterpiece", description: nil)
				@print.reload
				@print.name.should_not eq("Masterpiece")
				@print.description.should eq("Something Descriptive")
			end
		end		
	end

	describe 'Delete destroy' do

		before :each do
			@print = create(:print)
		end


		it "deletes the prints" do
			expect{
				delete :destroy, id: @print.id
			}.to change(Print, :count).by(-1)
		end

		it "redirects to prints#index" do
			delete :destroy, id: @print.id
			response.should redirect_to(prints_path)
		end
	end

end