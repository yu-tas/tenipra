class MenusController < ApplicationController
  def index
    @q = Menu.order(created_at: :desc).ransack(params[:q])
    @menus = @q.result(distinct: true).page(params[:page]).per(10)
    @favorites = current_user ? current_user.favorites.pluck(:menu_id,:id).to_h : {}
  end  
  
  def show
    @menu = Menu.find(params[:id])
    @favorite = current_user&.favorites&.find_by(menu_id: @menu.id)
  end  
end
