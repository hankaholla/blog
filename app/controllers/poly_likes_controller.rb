class PolyLikesController < ApplicationController

    def create
        current_user = User.find(like_params[:user_id])
        @like = current_user.poly_likes.new(like_params)
        
        if @like.save
            redirect_to @like.likeable
        else
            render @like.likeable, status: :unprocessable_entity
        end
    end

    private
    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end
    
  end
  