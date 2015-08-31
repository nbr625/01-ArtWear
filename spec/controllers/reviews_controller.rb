require 'spec_helper'
require 'rails_helper'

describe ReviewsController do
	it "should redirect to root if the user is not signed in" do
		current_user = nil
		response.should redirect_to(root_url)
	end
	describe "GET #index" do
		it "iterates all then reviews into an array" do
			review = FactoryGirl.build(:review)
			get :index
			assigns(:reviews).should eq([review])
		end

		it "renders the index view if user signed in" do
			current_user = FactoryGirl.build(:user)
			get :index
			response.should render_template :index
		end
	end


	describe "GET #new" do
		it "should redirect to root if the user is not signed in" do
			current_user = nil
			response.should redirect_to(root_url)
		end
		it "renders the :new template if user signed in" do
			current_user = FactoryGirl.build(:user)
			get :new, id: FactoryGirl.build(:review)
			response.should render_template :new
		end
	end

	describe "POST #create" do

		context "with attributes within parameters" do
			it "saves the review in the database" do
				expect{
					post :create, review: FactoryGirl.build.attributes_for(:review)
				}.to change(Review,:count).by(1)
			end
			it "redirect to the review index template" do
				post :create, review: FactoryGirl.build.attributes_for(:review)
				response.should redirect_to review.last
			end
		end

		context "with invalid attributes" do
			it "does not save the new review to the database" do
				expect{
					post :create, review: FactoryGirl.build.attributes_for(:invalid_review)
				}.to_not change(Review, :review)
			end
			it "re-renders the :new template" do
				post :create, review: FactoryGirl.build.attributes_for(:invalid_review)
				response.should render_template :new
			end
		end
	end

	describe "PUT update" do
		before :each do
			@review = FactoryGirl.build(:review, rating: 4, comment: "It's okay")
		end

		context "valid attributes" do
			it "located the requested @review" do
				put :update, id: @review, review: FactoryGirl.build.attributes_for(:review)
				assigns(:review).should eq(@review)
			end

			it "changes @review's attributes" do
				put :update, id: @review,
					review: FactoryGirl.build.attributes_for(:review, rating: 4, comment: "It's okay")
				end
			end

			it "redirect to the updated review" do
				put :update, id: @review, review: FactoryGirl.build.attributes_for(:review)
				response.should redirect_to @print
			end

		end

		context "invalid attributes" do

			it "located the appropiarte @review" do
				put :update, id: @review, review: FactoryGirl.build.attributes_for(:invalid_review)
				assigns(:review).should eq(@review)
			end

			it "does not change @review's attributes" do

				put :update, id: @review,
					review: FactoryGirl.build.attributes_for(:review, rating: 4, comment: nil)
				@review.reload
				@review.rating.should_not eq(4)
				@review.comment.should_not eq("It's okay")
			end

			it "re-renders the edit method" do
				put :update, id: @review, review: FactoryGirl.build.attributes_for(:invalid_review)
				response.should render_template :edit
			end

		end		

	end

	describe 'Delete destroy' do

		before :each do
			@review = FactoryGirl.build(:review)
		end

		it "deletes the reviews" do
			expect{
				delete :destroy, id: @review
			}.to change(Review, :count).by(-1)
		end

		it "redirects to reviews#index" do
			delete :destroy, id: @review
			response.should redirect_to @review
		end
	end

end