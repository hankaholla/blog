class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: [:destroy]

  def create
    @user = User.find_by(user_name: comment_params[:user_name])
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(body: comment_params[:body], 
                                        status: comment_params[:status], user_id: @user.id)
    # @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
    end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end
  
  private
  def comment_params
    params.require(:comment).permit(:user_name, :body, :status)
  end

end
