class FavoritesController < ApplicationController
  def create
    @menu = Menu.find_by(id: params[:menu_id])
    if @menu
      @favorite = current_user.favorites.create(menu: @menu)
      message =  "#{@favorite.menu.title}をお気に入りに登録しました！"
    else
      message =  "メニューが見つかりませんでした。"
    end
  
    respond_to do |format|
      format.html { redirect_to menus_path, notice: message }
      format.js
    end
  end
  
  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @menu = @favorite.menu
    if @favorite
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
end 
