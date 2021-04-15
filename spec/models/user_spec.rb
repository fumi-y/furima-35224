require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  #ターミナルコピペ用 bundle exec rspec spec/models/user_spec.rb

  describe 'ユーザー新規登録' do
    it 'ニックネームが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '同じメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスに「＠」を含んでいないと登録できない' do
      @user.email = '1234com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが５文字以下では登録できない' do
      @user.password = 'asdf1'
      @user.password_confirmation = 'asdf1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードが半角英字のみだと登録できない' do
      @user.password = 'asdfgh'
      @user.password_confirmation = 'asdfgh'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードが半角数字のみだと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードと確認用パスワードは値が一致していないと登録できない' do
      @user.password = '123asd'
      @user.password_confirmation = 'asd123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '苗字が空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '苗字が全角以外では登録できない' do
      @user.last_name = '空条ｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")

    end

    it '名が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名が全角以外では登録できない' do
      @user.first_name = '承太ﾛｩ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it '苗字のフリガナが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '苗字のフリガナが全角カタカナ以外では登録できない' do
      @user.last_name_kana = 'クウジョう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it '名のフリガナが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '名のフリガナが全角カタカナ以外では登録できない' do
      @user.first_name_kana = 'ジョウタロう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it '生年月日が空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
