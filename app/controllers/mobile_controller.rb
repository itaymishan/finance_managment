class MobileController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create   
    render 'index'
  end

end
