class ItemsController < ApplicationController

  def index
    @ladyitems = get_items(1)
    @manitems = get_items(199)
    @cameraitems = get_items(892)
    @hobyitems = get_items(679)
  end

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

  def get_items(id)
    category = Category.find(id)
    items = Item.where(category_id: category).order('id DESC').limit(10)
  end
end
