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
end
