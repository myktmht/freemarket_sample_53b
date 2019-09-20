class ItemsController < ApplicationController
  
  def index
    @ladyitems = get_items(1)
    @manitems = get_items(2)
    @cameraitems = get_items(8)
    @hobyitems = get_items(6)
  end
  
  def new
  end

  def create
  end

  def show
  end
  

  private
  def get_items(id)
    category = Category.find(id)
    items = Item.where(category_id: category).order('id DESC').limit(10)
  end
end
