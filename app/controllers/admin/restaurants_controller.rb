class Admin::RestaurantsController < ApplicationController
  before_action :set_restaurant, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
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
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "更新餐廳資料成功！"
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "更新未成功"
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    flash[:alert] = "刪除餐廳該筆資料成功。"
    redirect_to admin_restaurants_path
  end
  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :opening_hours, :address, :description, :image)
  end


end
