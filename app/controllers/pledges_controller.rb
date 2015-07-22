class PledgesController < ApplicationController
  before_action :set_print
  before_action :authenticate_user!
  before_action :set_pledge, except: [:create, :new]

  def new
    @pledge = current_user.pledges.build
  end

  def thank_you    
  end


  def create
    @pledge = current_user.pledges.build(pledge_params)
    @pledge.user_id = current_user.id
    @pledge.print_id = @print.id

    if @pledge.save
      redirect_to @print
    else
      render 'new'
    end
  end


  private

    def set_pledge
      @pledge = Pledge.find(params[:id])
    end
   

    def set_print
      @print = Print.find(params[:print_id])
    end


    def pledge_params
      params.require(:pledge).permit(:agree, :user_id, :print_id)
    end
end

