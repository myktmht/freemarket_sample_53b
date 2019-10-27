require 'rails_helper'

describe ItemsController do

  describe 'GET #index' do

    before do
      @ladies = Category.create(id: 1 ,name: "レディース")
      @men = Category.create(id: 199 ,name: "メンズ")
      @camera = Category.create(id: 892 ,name: "カメラ")
      @hoby = Category.create(id: 679 ,name: "ホビー")

      @user = create(:user, id:1)
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end

    it '出品したレディースアイテムの表示が最新のid順になっているか' do
      items = create_list(:item, 4)
      get :index
      expect(assigns(:ladyitems)).to match(items.sort{|a, b| b.id <=> a.id})
    end
  end

  describe 'GET #new' do

    context 'as an authenticate user' do
      before do
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :new
        expect(response).to be_successful
      end

      it 'has a 200 status code' do
        sign_in @user
        get :new
        expect(response).to have_http_status(:ok)
      end
    end

    context 'as a gest user' do
      it "does not respond successfully" do
        get :new
        expect(response).to_not be_successful
      end

      it "returns a 302 status code" do
        get :new
        expect(response).to have_http_status "302"
      end

      # ログイン画面にリダイレクトされているか？
      it "redirects the page to /login" do
        get :new
        expect(response).to redirect_to "/login"
      end
    end
  end

  describe 'POST #create'do
    let(:item) { create(:item) }

    it 'is valid with colums' do
      item = build(:item)
      expect(item).to be_valid
    end

    it 'is invalid without name' do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name])
    end

    it 'is invalid without price' do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price])
    end

    it 'is invalid without description' do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description])
    end

    it 'is invalid without condition' do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition])
    end

    it 'is invalid without shipping_fee' do
      item = build(:item, shipping_fee: nil)
      item.valid?
      expect(item.errors[:shipping_fee])
    end

    it 'is invalid without shipping_from' do
      item = build(:item, shipping_from: nil)
      item.valid?
      expect(item.errors[:shipping_from])
    end

    it 'is invalid without days_before_shipping' do
      item = build(:item, days_before_shipping: nil)
      item.valid?
      expect(item.errors[:days_before_shipping])
    end

    it 'is invalid without shipping_method' do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method])
    end

    it 'is invalid without trade_status' do
      item = build(:item, trade_status: nil)
      item.valid?
      expect(item.errors[:trade_status])
    end

    it 'is invalid without user_id' do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id])
    end

    it 'is invalid without category_id' do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id])
    end
  end
end