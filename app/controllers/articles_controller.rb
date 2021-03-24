class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
    @votes_by_article = Vote.count_by_article
    @votes_by_category = Vote.count_by_category
    @prioritized_categories = Category.prioritize(@votes_by_category).ids
    @featured = Article.most_popular(@votes_by_article)
    @second = Article.where(category_id: @prioritized_categories[1]).order(created_at: :desc).first
    @third = Article.where(category_id: @prioritized_categories[2]).order(created_at: :desc).first
    @fourth = Article.where(category_id: @prioritized_categories[3]).order(created_at: :desc).first
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :text, :image, :author_id, :category_id)
  end
end
