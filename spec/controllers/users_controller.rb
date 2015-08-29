require 'spec_helper'

describe UsersController do
	describe "GET #index" do
		it "iterates all then users into an array" do
			user = Factory(:user)
			get :index
			assigns(:users).should eq([user])
		end

		it "renders the index view" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		it "it funnels the right user to the @user variable"
			user = Factory(:user)
			get :show, id: user
			assigns(:user).should eq(user)
		end

		it "renders the :show template" 
			get :show, id: Factory(:user)
			response.should render_template :show
		end
	end

	describe "GET #new" do
		it "renders the :new template" do
			get :new, id: Factory(:user)
			response.should render_template :new
		end
	end

	describe "POST #create" do

		context "with attributes within parameters" do
			it "saves the user in the database" do
				expect{
					post :create, user: Factory.attributes_for(:user)
				}.to change(User,:count).by(1)
			end
			it "redirect to the user index template" do
				post :create, user: Factory.attributes_for(:user)
				response.should redirect_to user.last
			end
		end

		context "with invalid attributes" do
			it "does not save the new user to the database" do
				expect{
					post :create, user: Factory.attributes_for(:invalid_user)
				}.to_not change(User, :user)
			end
			it "re-renders the :new template" do
				post :create, user: Factory.attributes_for(:invalid_user)
				response.should render_template :new
			end
		end
	end

	describe "PUT update" do
		before :each do
			@user = Factory(:user, username: "Nicolas Rivers", email: "niberrizbe@gmail.com")
		end

		context "valid attributes" do
			it "located the requested @user" do
				put :update, id: @user, user: Factory.attributes_for(:user)
				assigns(:user).should eq(@user)
			end

			it "changes @user's attributes" do
				put :update, id: @user,
					user: Factory.attributes_for(:user, username: "Nicolas Rives", email: "niberrizbe@gmail.com")
				end
			end

			it "redirect to the updated user" do
				put :update, id: @user, user: Factory.attributes_for(:user)
				response.should redirect_to @user
			end

		end

		context "invalid attributes" do

			it "located the appropiarte @user" do
				put :update, id: @user, user: Factory.attributes_for(:invalid_user)
				assigns(:user).should eq(@user)
			end

			it "does not change @user's attributes" do

				put :update, id: @user,
					user: Factory.attributes_for(:user, username: "Nicolas Rives", creator: nil)
				@user.reload
				@user.username.should_not eq("Nicolas Rivers")
				@user.email.should_not eq("niberrizbe@hotmail.com")
			end

			it "re-renders the edit method" do
				put :update, id: @user, user: Factory.attributes_for(:invalid_user)
				response.should render_template :edit
			end

		end		

	end

	describe 'Delete destroy' do

		before :each do
			@user = Factory(:user)
		end

		it "deletes the users" do
			expect{
				delete :destroy, id: @user
			}.to change(User, :count).by(-1)
		end

		it "redirects to users#index" do
			delete :destroy, id: @user
			response.should redirect_to root
		end
	end

end