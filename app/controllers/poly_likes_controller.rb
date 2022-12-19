class PolyLikesController < ApplicationController

    def create
        current_user = User.find(like_params[:user_id])
        @like = current_user.poly_likes.new(like_params)
        
        if @like.save
            if @like.likeable_type == "Article"
                redirect_to @like.likeable
            else 
                parent_comment = Comment.find(like_params[:likeable_id])
                parent_article = Article.find(parent_comment.article_id)
                redirect_to parent_article
            end
        else
            render @like.likeable, status: :unprocessable_entity
        end
    end

    private
    def like_params
        params.require(:poly_like).permit(:user_id, :likeable_id, :likeable_type)
    end
    
  end
  