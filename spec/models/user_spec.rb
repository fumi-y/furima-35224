require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'ニックネームが空だと登録できない' do
    end

    it 'メールアドレスが空だと登録できない' do
    end

    it '同じメールアドレスは登録できない' do
    end

    it 'メールアドレスに「＠」を含んでいないと登録できない' do
    end

    it 'パスワードが空だと登録できない' do
    end

    it 'パスワードが５文字以下では登録できない' do
    end

    it 'パスワードが半角英字のみだと登録できない' do
    end

    it 'パスワードが半角数字のみだと登録できない' do
    end

    it 'パスワードと確認用パスワードは値が一致していないと登録できない' do
    end

    it '苗字が空だと登録できない' do
    end

    it '苗字が全角以外では登録できない' do
    end

    it '名が空だと登録できない' do
    end

    it '名が全角以外では登録できない' do
    end

    it '苗字のフリガナが空だと登録できない' do
    end

    it '苗字のフリガナが全角カタカナ以外では登録できない' do
    end

    it '名のフリガナが空だと登録できない' do
    end

    it '名のフリガナが全角カタカナ以外では登録できない' do
    end

    it '生年月日が体と登録できない' do
    end
  end
end
