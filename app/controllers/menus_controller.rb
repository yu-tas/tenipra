class MenusController < ApplicationController
  def index
    @menus = Menu.order(created_at: :desc)
    @menus = @menus.page(params[:page]).per(10)
  end
  

  def show
    @menu = Menu.find(params[:id])
  end
end
