require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の登録' do
    
    context '商品出品の登録ができる時' do
      it '全てのフォームに入力があれば商品登録できる' do
      end

      it '販売価格が300円以上なら商品登録できる' do
      end

      it '販売価格が9,999,999円以内なら商品登録できる' do
      end
    end

    context '商品出品の登録ができない時' do

      it '商品画像が空だと登録できない' do
      end

      it '商品名が空だと登録できない' do
      end

      it '商品の説明が空だと登録できない' do
      end

      it 'カテゴリーの選択をしていないと登録できない' do
      end

      it '商品の状態を選択していないと登録できない' do
      end

      it '配送料の負担を選択していないと登録できない' do
      end

      it '発送元の地域を選択していないと登録できない' do
      end

      it '発送までの日数を選択していないと登録できない' do
      end

      it '販売価格が空だと登録できない' do
      end

      it '販売価格が299円以内だと登録できない' do
      end

      it '販売価格が10,000,000円以上だと登録できない' do
      end

      it '販売価格が半角数字以外では登録できない' do
      end

      it 'ユーザーログインしていないと登録できない' do
      end
    end
  end
end
