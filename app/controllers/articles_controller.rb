class ArticlesController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  # authorize_resource

  def index
    # @posts = Post.order(:title).page params[:page]
    @articles = Article.page(params[:page])
    # @articles = Article.order(:title).page params[:page]
  
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
    # @users = all_users_form
    authorize! :edit, @article
    render :edit
    # @user = User.find(@article.user_id)
  end

  def update
    @article = Article.find(params[:id])

    # can? :update, @article # => true
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
