class FavoritesController < ApplicationController
  before_action :set_menu, only: [:create]
  before_action :set_favorite, only: [:destroy]
  def index
    if params[:user_id].present? && current_user.id == params[:user_id].to_i
      @user = User.find(params[:user_id])
      @favorites = @user.favorites.map(&:menu) # お気に入りに関連するメニューを取得
    else
      @favorites = []
    end
  end 

  def create
    if @menu
      @favorite = current_user.favorites.create(menu: @menu)
      message = "#{@favorite.menu.title}をお気に入りに登録しました！"
    else
      message = "メニューが見つかりませんでした。"
    end
    respond_to do |format|
      format.html { redirect_to menus_path, notice: message }
      format.js
    end
  end
  
  def destroy
    if @favorite
      @menu = @favorite.menu
      @favorite.destroy
      message = "#{@menu.title}をお気に入り解除しました！"
    else
      message = "お気に入りが見つかりませんでした。"
    end
    respond_to do |format|
      format.html { redirect_to menus_path, notice: message }
      format.js
    end
  end  

  private

  def set_menu
    @menu = Menu.find_by(id: params[:menu_id])
  end

  def set_favorite
    @favorite = current_user.favorites.find_by(id: params[:id])
  end
end
