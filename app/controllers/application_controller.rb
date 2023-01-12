class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    rescue_from CanCan::AccessDenied do
        flash[:alert] = 'Access denied!'
        redirect_to root_url
    end
end
