require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品の出品ができる場合' do
      it "すべての項目が入力されていれば、出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "item_nameが空だと出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
  
      it "explanationが空だと出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "statusが選択されていないと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "delivery_chargeが選択されていないと出品できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it "prefecturesが選択されていないと出品できない" do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end

      it "daysが選択されていないと出品できない" do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end

      it "categoryが選択されていないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが300円以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end

      it "priceが9999999円以上だと出品できない" do
        @item.price = 99999999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end

      it "priceに半角数字以外が含まれている場合は出品できない" do
        @item.price = "abcde"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
