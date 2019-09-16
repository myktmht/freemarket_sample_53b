class ItemsController < ApplicationController

  def new
    @item = Item.new
    @category1 = Category.eager_load(children: {children: :children}).where(parent_id: 0) 
  end

  def create
  end

  def show
  end
  
  private

  def item_params
    prams.require(:item).permit(:name, :price, :description, :condition, :shipping_fee, :days_before_shipping, :shipping_method, :trade_status).merge(user_id: current_user.id)
  end

end
