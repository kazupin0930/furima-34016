require 'rails_helper'

RSpec.describe PurchaseManagementShippingAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:purchase_management_shipping_address, user_id: @user.id, item_id: @item.id)
      sleep(0.1)
    end

    describe '商品購入機能' do
      context '購入できるとき' do
        it '全て入力されていれば購入できること' do
          expect(@order).to be_valid
        end

        it '建物名がnilでも購入できること' do
          @order.building_name = ''
          expect(@order).to be_valid
        end

        it 'tokenがあれば保存ができること' do
          expect(@order).to be_valid
        end
      end

      context '商品購入できないとき' do
        it '配送先の情報として、郵便番号が無いと購入できないこと' do
          @order.postal_code = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code can't be blank")
        end

        it '配送先の情報として、都道府県の値が1だと購入できないこと' do
          @order.shipping_area_id = 1
          @order.valid?
          expect(@order.errors.full_messages).to include('Shipping area Select')
        end

        it '配送先の情報として、市区町村が無いと購入できないこと' do
          @order.municipality = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Municipality can't be blank")
        end

        it '配送先の情報として、番地が無いと購入できないこと' do
          @order.address = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Address can't be blank")
        end

        it '配送先の情報として、電話番号が無いと購入できないこと' do
          @order.phone_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end

        it '郵便番号の保存にはハイフンが無いと購入できないこと（123-4567となる）' do
          @order.postal_code = '1231111'
          @order.valid?
          expect(@order.errors.full_messages).to include('Postal code Input correctly')
        end

        it '電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）' do
          @order.phone_number = 'aaaaaaaaaaa'
          @order.valid?
          expect(@order.errors.full_messages).to include('Phone number Input only number')
        end

        it '電話番号が12桁以上の数値の場合は保存できない' do
          @order.phone_number = '09012345678912345'
          @order.valid?
          expect(@order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
        end

        it 'tokenが空では登録できないこと' do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
