require 'spec_helper'
require 'rails_helper'

describe ReviewsController do
	
	describe "GET #index" do
		before(:each) do
			sign_in create(:user)
			@print = create(:print)
			@review = create(:review, print_id: @print.id)
		end
		it "iterates all then reviews into an array" do

			visit print_reviews_path(@print)
			[@review].should eq(@print.reviews)
		end

		it "renders the index view if user signed in" do
			visit print_reviews_path(@print)
			response.should be_success
		end
	end


	describe "GET #new" do
		before(:each) {@print = create(:print)}
		it "renders the :new template if user signed in" do		
			sign_in create(:user)
			visit new_print_review_path(@print)
			response.should be_success
		end
	end

	describe "POST #create" do
		before(:each) do
			sign_in create(:user)
			@print = create(:print)

		end

		context "with attributes within parameters" do
			before(:each) {@review_attributes = attributes_for(:review, print_id: @print.id)}
			
			it "saves the review in the database" do
				expect{
					post :create, print_id: @print.id, review: @review_attributes
				}.to change(Review,:count).by(1)
			end
			it "redirect to the review index template" do
				post :create, print_id: @print.id, review: @review_attributes
				response.should redirect_to print_path(@print)
			end
		end

		context "with invalid attributes" do
			before(:each) {@invalid_review_attributes = attributes_for(:review, print_id: @print.id, rating: nil)}
			it "does not save the new review to the database" do
				expect{
					post :create, print_id: @print.id, review: @invalid_review_attributes
				}.to_not change(Review, :count)
			end
			it "re-renders the :new template" do
				post :create, print_id: @print.id, review: @invalid_review_attributes
				response.should render_template :new
			end
		end
	end

	describe "PUT update" do
		before :each do
			sign_in create(:user)
			@print = create(:print)
			@review = create(:review, print_id: @print.id, rating: 4, comment: "It's okay")	
		end

		context "valid attributes" do
			it "located the requested @review" do
				put :update, print_id: @print.id, id: @review.id, review: attributes_for(:review)
				assigns(:review).should eq(@review)
			end

			it "changes @review's attributes" do
				put :update, print_id: @print.id, id: @review.id,
					review: attributes_for(:review, rating: 5, comment: "amazing!!!")
				@review.reload
				@review.rating.should eq(5)
				@review.comment.should eq("amazing!!!")

			end

			it "redirect to the updated review" do
				put :update, print_id: @print.id, id: @review.id, review: attributes_for(:review)
				response.should redirect_to print_path(@print)
			end

		end

		context "invalid attributes" do

			it "located the appropiarte @review" do
				put :update, print_id: @print.id, id: @review.id, review: attributes_for(:review, print_id: @print.id, rating: 5, comment: nil)
				assigns(:review).should eq(@review)
			end

			it "does not change @review's attributes" do

				put :update, print_id: @print.id, id: @review.id,
					review: attributes_for(:review, print_id: @print.id, rating: 5, comment: nil)
				@review.reload
				@review.rating.should eq(4)
				@review.comment.should eq("It's okay")
			end

			it "re-renders the edit method" do
				put :update, print_id: @print.id, id: @review.id, review: attributes_for(:review, print_id: @print.id, rating: 5, comment: nil)
				response.should render_template :edit
			end

		end		

	end

	describe 'Delete destroy' do

		before :each do
			sign_in create(:user)
			@print = create(:print)
			@review = create(:review, print_id: @print.id)
			
		end

		it "deletes the reviews" do
			expect{
				delete :destroy, print_id: @print.id, id: @review.id
			}.to change(Review, :count).by(-1)
		end

		it "redirects to reviews#index" do
			delete :destroy, print_id: @print.id, id: @review.id
			response.should redirect_to print_path(@print)
		end
	end

end