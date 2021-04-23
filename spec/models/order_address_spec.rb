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
        expect(@order_address).to be_valid
      end

      it '郵便番号が-(ハイフン)を含めた7文字の数字で保存できる' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end

      it '電話番号が11桁以内の数字であれば保存できる' do
        @order_address.telephone_number = '12345678901'
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できない時' do
      it '郵便番号が空では登録できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に-(ハイフン)がなければ登録できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が空では登録できない' do
        @order_address.prefecture = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県のidが0だと登録できない' do
        @order_address.prefecture = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it '市区町村が空では登録できない' do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では登録できない' do
        @order_address.street_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_address.telephone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が12桁以上では登録できない' do
        @order_address.telephone_number = "123456789012"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it '電話番号が英数字混合だと登録できない' do
        @order_address.telephone_number = "090aaaa1234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it '電話番号が全角文字では登録できない' do
        @order_address.telephone_number = "１１１２２２２３３３３"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'トークンが空では登録できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザーが存在していないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品が存在していないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
