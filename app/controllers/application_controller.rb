class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    # skip_before_action :verify_authenticity_token
    
    rescue_from CanCan::AccessDenied do
        flash[:alert] = 'Access denied!'
        redirect_to root_url
    end
end
