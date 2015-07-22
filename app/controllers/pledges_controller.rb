class PledgesController < ApplicationController


  def new
    @pledge = current_user.pledges.build
  end


  def create
    @pledge = current_user.pledges.build(pledge_params)
    @pledge.user_id = current_user.id
    @pledge.print_id = @print.id

    if @review.save
      redirect_to @print
    else
      render 'new'
    end
  end


  private

    def pledge_params
      params.require(:pledge).permit(:agree, :user_id, :print_id)
    end
end

