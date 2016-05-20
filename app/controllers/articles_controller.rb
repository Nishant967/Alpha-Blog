class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, excep: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles =Article.paginate(page: params[:page], per_page: 5)

  end

  def edit
   # @article = Article.find(params[:id])
  end

  def create
    #debugger
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = current_user
    # checking fo validation here
    if @article.save
      flash[:success] = " Article created successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    #redirect_to article_path(@article)

  end

  def update
  #  @article = Article.find(params[:id])
    @article.user = current_user
    if @article.update(article_params)
      flash[:success] = " Article updated successfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
   # @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = " Article deleted successfully"
    redirect_to articles_path
  end


  def show
    #@article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

  # functio to partialise article finding code in the controller
  private
    def set_article
      @article = Article.find(params[:id])
    end

    def require_same_user
      if current_user != @article.user
        flash[:danger]= "You can modify your stories only"
        redirect_to root_path
      end
    end

end
