class HomeController < ApplicationController

  def index
    @categories = Category.all.arrange
  end
end
