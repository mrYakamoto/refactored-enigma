class ShoppingCart < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
end
