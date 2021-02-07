require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品を出品できるとき' do
        it '全て入力されていれば出品できること' do
          expect(@item).to be_valid
        end
      end

      context '商品を出品できないとき' do
        it '商品画像がなければ出品できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が空だと出品できないこと' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it '商品の説明が空だと出品できないこと' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'カテゴリーの情報の値が1だと出品できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end

        it '商品の状態についての情報の値が1だと出品できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition Select')
        end

        it '配送料の負担についての情報の値が1だと出品できないこと' do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping charge Select')
        end

        it '発送元の地域についての情報の値が1だと出品できないこと' do
          @item.shipping_area_id = 1

          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping area Select')
        end

        it '発送までの日数についての情報の値が1だと出品できないこと' do
          @item.day_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Day to ship Select')
        end

        it '販売価格についての情報が空だと出品できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '販売価格が¥300より少ない時は出品できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it '販売価格がが¥9999999より多い時は出品できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end

        it '販売価格は半角数字のみでないと保存できないこと' do
          @item.price = 'aaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
      end
    end
  end
end
