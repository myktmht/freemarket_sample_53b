class PurchaseController < ApplicationController

  require 'payjp'

  before_action :set_item

  def index
    card = current_user.cards.first
      #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to action: "show"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def done
  end

  def show
  end

  def pay
    card = current_user.cards.first
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price, #支払い金額
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円    
    )
    redirect_to action: 'done' #完了画面に移動
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
end