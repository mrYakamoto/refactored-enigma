class User < ActiveRecord::Base
  has_secure_password
  has_many :shopping_carts
  has_many :items, through: :shopping_carts

  before_save :check_admin

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def is_admin?
    return self.user_type == 1
  end

  private

  def check_admin
    self.user_type = 0 if self.user_type.nil?
  end
end
