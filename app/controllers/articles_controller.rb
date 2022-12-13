class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all 
  end

  def show
    @article = Article.find(params[:id])
    # user = User.find(@article.user_id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    puts article_params[:user_id]
    @article.user_id = User.find_by(user_name: article_params[:user_id]).id

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :user_name) #ktore parametre su povolene
    end

end
