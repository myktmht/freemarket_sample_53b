class ItemsController < ApplicationController
  before_action :set_image

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.build
    @category1 = Category.eager_load(children: {children: :children}).where(parent_id: 0)
    unless user_signed_in?
      redirect_to new_user_session_url
    end
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    @item.save
    redirect_to root_path
  end

  def show
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :price, :description,:category_id, :condition, :shipping_fee, :shipping_from, :days_before_shipping, :shipping_method, :trade_status, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_image
    # 該当する画像を取得
    @images = Image.where(params[:item_id])
  end

end
