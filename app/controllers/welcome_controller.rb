class WelcomeController < ApplicationController

  def index
    @categories = Category.all
    @locations = Location.all
  end
end
