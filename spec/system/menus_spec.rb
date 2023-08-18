require 'rails_helper'
RSpec.describe '練習メニューの管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:difficulty_level) { FactoryBot.create(:difficulty_level) }
  let!(:menu) { FactoryBot.create(:menu, difficulty_level_id: difficulty_level.id) }
  let!(:second_menu) { FactoryBot.create(:second_menu, difficulty_level_id: difficulty_level.id) }

  describe '詳細機能のテスト' do
    context '練習メニューの詳細を確認した場合' do
      it '練習メニュー名前が表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        click_link '詳細', match: :first
        sleep(0.5)
        expect(page).to have_content 'アドバンス練習'
        expect(page).to have_content '上級者向けの練習メニューです。'
      end
    end
  end

  describe '一覧機能のテスト' do
    context '一覧画面に遷移した場合' do
      it '投稿されている練習メニューが表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        expect(page).to have_content 'アドバンス練習'
        expect(page).to have_content '基本練習'
      end
    end
  end

  describe '検索機能のテスト' do
    context '練習の情報を検索した場合' do
      it '検索結果が表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        fill_in 'q_title_cont', with: '基本練習'
        click_button '検索'
        expect(page).to have_content '基本練習'
      end
    end
  end
end