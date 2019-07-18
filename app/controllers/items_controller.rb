class ItemsController < ApplicationController
  before_action :set_item, only: %w[show edit update destroy]

  def index
    @items = Item.all
  end

  def show; end

  def edit; end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy

    redirect_to items_path
  end

  def search
    @items = params[:q].nil? ? [] : Item.search(params[:q])
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :category_id)
  end
end
