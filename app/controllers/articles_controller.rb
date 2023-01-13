class ArticlesController < ApplicationController

  # authorize_resource

  def index
    @articles = Article.page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
    @users = all_users_form
  end

  def new
    @article = Article.new
    @users = all_users_form
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id      #priradi ako autora prihlaseneho pouzivatela

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize! :edit, @article
    render :edit
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
    params.require(:article).permit(:title, :body, :status, :cover_photo) #ktore parametre su povolene
  end

  def all_users_form
    users_array = User.all.map { |u|  [u.first_name, u.id] }.to_h
  end

end
