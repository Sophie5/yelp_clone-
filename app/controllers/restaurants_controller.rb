class RestaurantsController < ApplicationController

  def index
  @restaurants = Restaurant.all
  end

  def new
    @restaurants = Restaurant.new
  end

  def create
   @restaurants = Restaurant.new(restaurant_params)
   if @restaurants.save
     redirect_to restaurants_path
   else
     render 'new'
   end
 end

 def show
  @restaurants = Restaurant.find(params[:id])
 end

 def edit
   @restaurant = Restaurant.find(params[:id])
 end

 def update
   @restaurant = Restaurant.find(params[:id])
   @restaurant.update(restaurant_params)
   redirect_to '/restaurants'
 end

 def destroy
   @restaurant = Restaurant.find(params[:id])
   @restaurant.destroy
   flash[:notice] = 'Restaurant deleted successfully!'
   redirect_to '/restaurants'
 end


 private

 def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
