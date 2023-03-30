require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  describe 'Index' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @category1 = Group.create!(
        name: 'Hotels',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )

      @category2 = Group.create!(
        name: 'Restaurants',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )

      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit groups_path
    end

    it 'should show all categories' do
      expect(page).to have_content('Hotels')
      expect(page).to have_content('Restaurants')
    end

    it 'should show the add a new category link' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'should add a new category' do
      click_link('NEW CATEGORY')
      expect(page).to have_current_path(new_group_path)
    end
  end

  describe 'New' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @category = Group.create!(
        name: 'Restaurants',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )

      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit new_group_path
    end

    it 'should show the category name field' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'should show the food submit button' do
      expect(page).to have_button('Save')
    end

    it 'should create a new category' do
      fill_in 'group_name', with: 'Restaurants'
      fill_in 'group_icon', with: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png'
      click_button 'Save'
      expect(page).to have_current_path(groups_path)
    end
  end
end
