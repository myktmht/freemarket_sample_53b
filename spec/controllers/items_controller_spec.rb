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
      it 'does not respond successfully' do
        get :new
        expect(response).to_not be_successful
      end

      it 'returns a 302 status code' do
        get :new
        expect(response).to have_http_status "302"
      end

      # ログイン画面にリダイレクトされているか？
      it 'redirects the page to /login' do
        get :new
        expect(response).to redirect_to login_path
      end
    end
  end

  # # 保留。imageの生成も必要。
  # describe 'POST #create' do
  #   let(:item) { create(:item) }

  #   before do
  #     @user = FactoryBot.create(:user)
  #   end

  #   context 'when it is valid' do      

  #     it 'has 302 status code' do
  #     end

  #     it 'redirects the page to root' do
  #       post :create
  #       expect(response).to redirect_to root_path
  #     end
  #   end

  #   context '無効な値のとき' do
  #     it 'has 200 status code' do
  #       expect(response).to have_no_http_status(:ok)
  #     end
  #   end
  # end
end