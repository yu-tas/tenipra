require 'rails_helper'
RSpec.describe 'ユーザ機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:difficulty_level) { FactoryBot.create(:difficulty_level) }
  let!(:menu) { FactoryBot.create(:menu, difficulty_level_id: difficulty_level.id) }
  let!(:second_menu) { FactoryBot.create(:second_menu, difficulty_level_id: difficulty_level.id) }

  describe 'ユーザ登録のテスト' do
    context 'ユーザを新規作成した場合' do
      it 'ユーザの新規登録がされる' do
        visit new_user_registration_path
        fill_in 'user_name', with: '一般ユーザ'
        fill_in 'user_email', with: 'test_user@gmail.com'
        fill_in 'user_password', with: '12345678'
        fill_in 'user_password_confirmation', with: '12345678'
        click_button '新規登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'ログインした場合' do
      it 'ログインした状態で練習メニュー一覧が表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_content '基本練習'
        expect(page).to have_content 'アドバンス練習'
      end
    end

    context 'ログインした場合' do
      it '自分の詳細画面(マイページ)に飛べる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        click_link 'プロフィール'
        expect(page).to have_content '一般ユーザさんのページ'
      end
    end

    context '一般ユーザが他人の詳細画面に飛ぶ場合' do
      it '練習メニュー一覧画面に遷移する' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        visit user_path(second_user)
        visit menus_path
        expect(page).to have_content 'メニュー検索'
      end
    end

    context 'ログアウト' do
      it 'トップページに遷移する' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        click_link 'ログアウト'
        expect(page).to have_content 'ログイン'
      end
    end
  end
end
  