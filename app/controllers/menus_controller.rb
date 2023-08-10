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

  def show
    @menu = Menu.find(params[:id])
    @player_positions = @menu.player_positions
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(player_positions: params[:player_positions])
      flash[:notice] = 'プレイヤーのポジションが正常に更新されました。'
      redirect_to @menu
    else
      flash.now[:alert] = 'プレイヤーのポジションの更新に失敗しました。'
      render :edit
    end
  end

  private

  def authorize_admin
    redirect_to root_path, alert: "管理者のみがアクセスできます。" unless current_user.admin?
  end
end
