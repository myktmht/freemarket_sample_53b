class ItemsController < ApplicationController
  before_action :set_image

  def index
    @items = Item.all
  end

  def new    
    redirect_to new_user_session_url unless user_signed_in?

    @item = Item.new
    10.times { @item.images.build }

    @category0 = Category.eager_load(children: {children: :children}).where(parent_id: 0)
    # 以下は仮おき。カテゴリーの絞り込みはJSを経由する必要がある。
    # @category1 = Category.where(parent_id: @category0.ids)
    # @category2 = Category.where(parent_id: @category1.ids)
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      # params[:image]['filename'].each do |i|
      #   binding.pry
      #   @images = @item.images.create!(filename: i)
      # end
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :condition, 
    :shipping_fee, :shipping_from, :days_before_shipping, :shipping_method, 
    :trade_status, images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end

  def set_image
    @images = Image.where(params[:item_id])
  end

  # def create_params
  #   params.require(:item).permit(images_attributes: [:image])
  # end
end
