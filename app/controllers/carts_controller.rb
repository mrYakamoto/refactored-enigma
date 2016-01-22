include UsersHelper

class CartsController < ApplicationController

  before_action :check_permissions

  def show
    @user = current_user
    if request.xhr?
      render 'carts/modal', layout: false
    end
    # if being loaded by ajax, only partial
    # otherwise render everything
  end

  def add_item
    p "=" * 100
    p params.inspect
    p "=" * 100
    current_user.shopping_carts.create(item_id: params[:item_id])
    flash[:success] = "Item added to cart."
    redirect_to '/cart'
  end

  def remove_item
    # find item with current_user's id and param[:item_id] and delete it
    item_to_remove = current_user.shopping_carts.where(item_id: params[:item_id], user_id: current_user.id).first
    item_to_remove.destroy
    flash[:success] = "#{item_to_remove.item.name} removed from cart."
    redirect_to '/cart'
  end

  def clear_cart
  end

end