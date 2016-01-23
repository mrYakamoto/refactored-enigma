require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'index action' do

    before do
      @all_items = 3.times.map do |n|
        Item.create!(name: 'hat',
                     price: 100,
                     description: 'a hat',
                     quantity: 1,
                     picture_url: 'www.some_url.com',
                     upc: '1234')
      end
    end

    it 'should load all items' do
      get :index
      expect(assigns[:items]).to eq @all_items
      expect(response.status).to eq 200
      expect(response).to have_rendered(:index)
    end
  end


  describe 'item create' do
    context 'when given valid params' do
      let(:item_params) do
        {name: 'hat',
         price: 100,
         description: 'a hat',
         quantity: 1,
         picture_url: 'www.some_url.com',
         upc: '1234'}
      end
      it 'should create the item and redirect to items index page' do
        expect{
          post :create, item: item_params
        }.to change{Item.count}.by(1)
        expect(response).to redirect_to("/items/#{Item.last.id}")
      end
    end
    context 'when given invalid params' do
      let :item_params do
        {name: 'hat',
         description: 'a hat',
         quantity: 1,
         picture_url: 'www.some_url.com',
         upc: '1234'}
      end
      it 'should not create the item and rerender the new item page' do
        expect{
          post :create, item: item_params
        }.to_not change{Item.count}
        expect(response).to have_rendered(:new)
      end
    end
  end

  # describe 'item show' do
  #   let(:item) {Item.new(name: 'hat',
  #                       price: 100,
  #                       description: 'a hat',
  #                       quantity: 1,
  #                       picture_url: 'www.some_url.com',
  #                       upc: '1234')}
  #   it 'should show a particular item' do
  #     get :show
  #     expect(assigns[:item]). to eq(item)
  #     expect(response.status).to eq(200)
  #     expect(response).to have_rendered(:show)
  #   end
  # end
end
