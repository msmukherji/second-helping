class RecipientsController < ApplicationController
  before_action :authenticate_recipient!

  def show
    @recipient = current_recipient
    render :show
  end

end
