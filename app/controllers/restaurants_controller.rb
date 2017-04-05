class RestaurantsController < ApplicationController

  def index
  @restaurants = Restaurant.all
  end

  def new
    @restaurants = Restaurant.new
  end

  def create
   @restaurants = Restaurant.create(restaurant_params)
   redirect_to '/restaurants'
 end
 def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
