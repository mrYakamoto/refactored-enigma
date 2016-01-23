require 'rails_helper'

RSpec.feature "CartItemCounts", type: :feature, js: true do
    let(:admin){FactoryGirl.create(:admin)}
    let(:user){FactoryGirl.create(:user)}
    let(:item){FactoryGirl.create(:item)}
   before(:each) do
    admin
    user
    item
   end
  context 'whatever' do
    it 'can see cart Shoppe' do
      visit root_path
      expect(page).to have_content("Shoppe")
    end

    feature 'cart number goes up'

    scenario 'user adds an item to the cart from an item show page', js: true do

    visit '/sessions/new'

    fill_in('Email Address', :with => 'schmo123@bob.com')
    fill_in('Password', :with => 'password')
    click_button('Login')

    visit "/items/#{item.id}"
    click_button 'Add to Cart'

    find('.cart-count').should have_content('1')
    end
  end
end



