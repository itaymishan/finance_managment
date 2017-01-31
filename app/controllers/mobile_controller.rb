class MobileController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
debugger        
        render 'index'        
    end

end
