require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  # bundle exec rspec spec/models/order_address_spec.rb

  describe '商品購入機能' do
    context '商品が購入機能できる時' do
      it '全てのフォームに入力があれば購入できる' do
      end

      it '郵便番号が-(ハイフン)を含めた7文字の数字で保存できる' do
      end

      it '電話番号が11桁以内の数字であれば保存できる' do
      end
    end
    context '商品が購入できない時' do
      it '郵便番号が空では登録できない' do
      end

      it '郵便番号に-(ハイフン)がなければ登録できない' do
      end

      it '都道府県が空では登録できない' do
      end

      it '市区町村が空では登録できない' do
      end

      it '番地が空では登録できない' do
      end

      it '電話番号が空では登録できない' do
      end

      it '電話番号が12桁以上では登録できない' do
      end

      it 'トークンが空では登録できない' do
      end

      it 'ユーザーが存在していないと登録できない' do
      end

      it '商品が存在していないと登録できない' do
      end
    end
  end
end
