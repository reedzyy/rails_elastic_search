class CategoriesController < ApplicationController
  before_action :set_category, only: %w[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show
    @items = @category.items
  end

  def edit; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
