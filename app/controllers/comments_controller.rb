class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: [:destroy]

  def create
    @article = Article.find(params[:article_id])

    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article), notice: "The comment's text can not be empty."
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment.article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end
  
  private
  def comment_params
    params.require(:comment).permit(:id, :body, :status)
  end

end
