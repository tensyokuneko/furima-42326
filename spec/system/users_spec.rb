# spec/system/users_spec.rb
require 'rails_helper'

RSpec.describe 'トップページのヘッダー', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログアウト状態' do
    it '「新規登録」「ログイン」ボタンが表示される' do
      visit root_path
      expect(page).to have_selector(:link_or_button, '新規登録')
      expect(page).to have_selector(:link_or_button, 'ログイン')
    end

    it '「新規登録」「ログイン」をクリックで各ページに遷移できる' do
      visit root_path
      click_on '新規登録'
      expect(page).to have_current_path(new_user_registration_path, ignore_query: true)

      visit root_path
      click_on 'ログイン'
      expect(page).to have_current_path(new_user_session_path, ignore_query: true)
    end
  end

  context 'ログイン状態' do
    it 'ニックネームと「ログアウト」ボタンが表示される' do
      visit new_user_session_path
      find('input[name="email"]').set(@user.email)
      find('input[name="password"]').set(@user.password)
      find('input[name="commit"]').click
      sleep 1
      expect(page).to have_current_path(root_path, ignore_query: true)

      expect(page).to have_content(@user.nickname)
      expect(find('.user_nav').find('span').hover).to have_content('ログアウト')
    end

    it '「ログアウト」をクリックするとログアウトできる' do
      visit new_user_session_path
      find('input[name="email"]').set(@user.email)
      find('input[name="password"]').set(@user.password)
      find('input[name="commit"]').click
      sleep 1
      expect(page).to have_current_path(root_path, ignore_query: true)

      find('.user_nav').find('span').hover
      click_on 'ログアウト'
      sleep 1
      expect(page).to have_current_path(root_path, ignore_query: true)
      expect(page).to have_selector(:link_or_button, '新規登録')
      expect(page).to have_selector(:link_or_button, 'ログイン')
      expect(page).to have_no_content(@user.nickname)
    end
  end
end
