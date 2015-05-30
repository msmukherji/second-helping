class DonorsController < ApplicationController
  before_action :authenticate_donor!

  def show
    @donor = current_donor 
    render :show
  end

end
