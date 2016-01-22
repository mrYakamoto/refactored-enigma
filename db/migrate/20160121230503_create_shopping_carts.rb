class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.references :user, null: false
      t.references :item, null: false
      t.timestamps null: false
    end
  end
end
