class ArticlesController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all 
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @user = User.find_by(user_name: article_params[:user_name])
    @article = Article.find(params[:article_id])

    puts @user.inspect
    @article = Article.new(title: article_params[:title], body: article_params[:body], 
                          status: article_params[:status], user_id: @user.id)
    
    # @article.user_id = @user.id

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    users_array = User.all.map { |u|  [u.first_name, u.id]}
    @users = users_array.map{ |n, i| {"first_name": n, "id": i}}
    # data.map { |f, l, g|  { :first_name => f, :last_name => l, :gender => g } }
    # @user = User.find(@article.user_id)
    # @users = User.all.as_json
  end

  def update
    @article = Article.find(params[:id])
    # @user = User.find_by(user_name: article_params[:user_name])
    
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
      params.require(:article).permit(:title, :body, :status, :user_id) #ktore parametre su povolene
    end

end
