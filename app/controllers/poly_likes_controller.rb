class PolyLikesController < ApplicationController

    def create
        user = User.find(current_user.id)    #(like_params[:user_id])
        @like = user.poly_likes.new(like_params)
        
        if @like.save
            if @like.likeable_type == "Article"
                redirect_to @like.likeable
            else
                redirect_to @like.likeable.article
            end
        else
            render @like.likeable, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find_by(id: params[:article_id])
        @like = PolyLike.find(params[:id])
        @like.destroy
        redirect_to article_path(@article), status: :see_other
    end

    private
    def like_params
        params.require(:poly_like).permit(:likeable_id, :likeable_type)  #:user_id, 
    end
    
  end
  