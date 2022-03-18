require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context 'ユーザー新規登録ができる場合' do
      it "すべての項目が入力されていれば、登録できる" do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない場合' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していると登録できない" do
        @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字未満では登録できない" do
        @user.password = 'a2233'
        @user.password_confirmation = 'a2233'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = '122333'
        @user.password_confirmation = '122333'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角英語のみでは登録できない" do
        @user.password = 'aabbcc'
        @user.password_confirmation = 'aabbcc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "全角文字を含むpasswordは登録できない" do
        @user.password = 'ＡＡbbcc'
        @user.password_confirmation = 'ＡＡbbcc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password_confirmation = '122a333'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "family_name_kanaにタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.family_name_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it "first_name_kanaにタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
  
      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
