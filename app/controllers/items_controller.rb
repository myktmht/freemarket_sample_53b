class ItemsController < ApplicationController
  before_action :set_image
  # before_action :set_search

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    @ladyitems = get_items(1)
    @manitems = get_items(199)
    @cameraitems = get_items(892)
    @hobyitems = get_items(679)
  end

  def new
    redirect_to new_user_session_url unless user_signed_in?
    @item = Item.new
    10.times { @item.images.build }

    @category0 = Category.eager_load(children: {children: :children}).where(parent_id: 0)
    # 以下は仮おき。カテゴリーの絞り込みはJSを経由する。
    # @category1 = Category.where(parent_id: @category0.ids)
    # @category2 = Category.where(parent_id: @category1.ids)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path and return
    else
      render :new
    end
  end

  def show
  end

  def search
    @q = Item.ransack(search_params)
    @items = @q.result(distinct: true)
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :condition, 
    :shipping_fee, :shipping_from, :days_before_shipping, :shipping_method, 
    :trade_status, images_attributes: [:name, :id]).merge(user_id: current_user.id)
  end

  def set_image
    @images = Image.where(params[:item_id])
  end

  def get_items(id)
    category = Category.find(id)
    items = Item.where(category_id: category).order('id DESC').limit(10)
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end

  def set_search
    @q = Item.search(params[:q])
  end
end
