require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できる場合' do
      it "全ての値が正しく入力されていれば保存できる" do
        expect(@purchase_address).to be_valid
      end

      it "building_nameが空でも保存できる" do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end
    
    context '配送先情報が保存できない場合' do
      it "user_idが空だと保存できない" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空だと保存できない" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空だと保存できない" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it "post_codeが空だと保存できない" do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

      it "prefectures_idが---だと保存できない" do
        @purchase_address.prefectures_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
      end

      it "municipalitiesが空だと保存できない" do
        @purchase_address.municipalities = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it "addressが空だと保存できない" do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空だと保存できない" do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
