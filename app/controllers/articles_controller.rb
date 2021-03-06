class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_login, only: %i[new create]

  def index
    @articles = Article.all
    @votes_by_article = Vote.count_by_article
    @votes_by_category = Vote.count_by_category
    @categories = Category.prioritize(@votes_by_category).ids
    @featured = Article.most_popular(@votes_by_article)
    @first = Article.last_by_category(@categories, 0)
    @second = Article.last_by_category(@categories, 1)
    @third = Article.last_by_category(@categories, 2)
    @fourth = Article.last_by_category(@categories, 3)
  end

  def show; end

  def new
    @article = Article.new
    @category_options = Category.all.map { |c| [c.name.titleize, c.id] }
  end

  def create
    @category_options = Category.all.map { |c| [c.name.titleize, c.id] }
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, :author_id, :category_id)
  end

  def require_login
    return unless current_user.nil?

    flash[:alert] = 'You must be logged in to access this section'
    redirect_to login_path
  end
end
