class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "新的餐廳紀錄已成功建立"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "很抱歉，有輸入錯誤，餐廳建立失敗"
      render :new
    end
  end

  def show
    set_restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :opening_hours, :address, :description)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
