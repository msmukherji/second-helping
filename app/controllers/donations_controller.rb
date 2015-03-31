class DonationsController < ApplicationController
  
  def show_all
    @donations = Donation.all
    render :show_all
  end

  def show
    @donation = Donation.find(params[:donation_id])
    render :show
  end

  def new
  end

  def create
  end

end