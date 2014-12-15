class CategoriesController < ApplicationController
  
  def map
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
  end

end