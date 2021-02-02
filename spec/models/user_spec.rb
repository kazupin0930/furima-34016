require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it "全て入力されていれば登録できること" do
          expect(@user).to be_valid
        end
      end

      context '新規登録できないとき' do
        it "ニックネームが空だと登録できないこと" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空だと登録できないこと" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "重複したemailが存在する場合登録できないこと" do #一意性制約
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "emailに@を含まない場合は登録できないこと" do
          @user.email = 'aaa.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it "パスワードが空だと登録できないこと" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "パスワードは、5文字以下だと登録できないこと" do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "パスワードは、半角英数字混合を含まない場合登録できないこと" do
          

        end

        it "パスワードは、確認用を含めて2回入力しない場合登録できないこと" do
          @user.password = "a1a1a1"
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "パスワードとパスワード（確認用）は、値が一致していない場合登録できないこと" do
          @user.password = "a1a1a1"
          @user.password_confirmation = "a2a2a2"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end
end