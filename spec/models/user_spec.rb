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

      context '新規登録できないとき' do
        it "ニックネームが空だと登録できないこと" do
          @user.nickname = ""
          @user valid?
          except(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "メールアドレスが空では登録できないこと" do
          @user.email = ""
          @user valid?
          expect(@user.errors.)
          expect(@user).to be_valid
        end

        it "パスワードの値が存在すれば登録できること" do
          @user.password = "aaaaaa"
          expect(@user).to be_valid
        end


        it "パスワードは、6文字以上あれば登録できること（6文字が入力されていれば、登録が可能なこと)" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          expect(@user).to be_valid
        end

        it "パスワードは、半角英数字混合での入力が必須である（半角英数字が混合されていれば、登録が可能なこと）" do
          
        end

        it "パスワードは、確認用を含めて2回入力すること" do

        end

        it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
        end
      end   
      
      it "メールアドレスが一意性であること" do

      end
    end
  end
end