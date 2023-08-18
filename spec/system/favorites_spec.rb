require 'rails_helper'

RSpec.describe 'お気に入り管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:difficulty_level) { FactoryBot.create(:difficulty_level) }
  let!(:menu) { FactoryBot.create(:menu, difficulty_level_id: difficulty_level.id) }
  let!(:second_menu) { FactoryBot.create(:second_menu, difficulty_level_id: difficulty_level.id) }

  describe 'お気に入り追加機能のテスト' do
    context 'お気に入りに追加した場合' do
      it 'お気に入りに追加されること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        click_link '詳細', match: :first
        sleep(0.5)
        click_link 'お気に入り'
        expect(page).to have_content 'お気に入り解除'
        expect(page).to have_content 'アドバンス練習'
      end
    end

    context 'お気に入りを削除した場合' do
      it 'お気に入りが削除されること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        click_link '詳細', match: :first
        sleep(0.5)
        click_link 'お気に入り'
        click_link 'お気に入り解除'
        binding.pry
        expect(page).to have_content 'お気に入り'
      end
    end
  end

  describe 'お気に入り一覧機能のテスト' do
    context 'お気に入りした場合' do
      it 'お気に入り一覧に表示されること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        click_link '詳細', match: :first
        sleep(0.5)
        click_link 'お気に入り'
        click_link 'プロフィール'
        click_link 'お気に入り一覧'
        expect(page).to have_content '練習メニューのお気に入り一覧'
        expect(page).to have_content 'アドバンス練習'
      end
    end
  end
end