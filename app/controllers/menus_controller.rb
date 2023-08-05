class MenusController < ApplicationController
      
  def index
    @q = Menu.order(created_at: :desc).ransack(params[:q])
    @menus = @q.result(distinct: true).page(params[:page]).per(10)
  end  
  
  def show
    @menu = Menu.find(params[:id])
  end
end
