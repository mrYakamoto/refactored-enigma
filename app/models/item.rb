class Item < ActiveRecord::Base
  has_many :shopping_carts
  has_many :users, through: :shopping_carts

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :picture_url, presence: true
  validates :upc, presence: true

  def formatted_price
    return '%.2f' % self.price
  end
end
