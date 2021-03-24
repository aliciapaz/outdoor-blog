class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
    @votes_by_article = Vote.count_by_article
    @votes_by_category = Vote.count_by_category
    @categories = Category.prioritize.order(:priority)
    @featured = Article.most_popular(@votes_by_article)
    # @featured = Article.find_by_priority(@votes, 0)
    # @second = Article.find_by_priority(@votes, 1)
    # @third = Article.find_by_priority(@votes, 2)
    # @fourth = Article.find_by_priority(@votes, 3)
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
