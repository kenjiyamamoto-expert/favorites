require 'rails_helper'
describe User do
  describe '#create' do
    #nameとemail、passwordとpassword_confirmationが存在すれば登録できる
    it "is valid with a name, email, password, password_confirmation" do
      user= build(:user)
      expect(user).to be_valid
    end
    #nameが空で登録できないこと
    it "is invalid without a name" do
      user= build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    #emailが空で登録できないこと
    it "is invalid without a email" do
      user= build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    #passwordが空で登録できないこと
    it "is invalid without a password" do
      user= build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    #passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user= build(:user,password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    #nameが２０文字以下であれば登録できること
    it "is valid with a name that has less than 20 characters" do
      user=build(:user,name: "aaaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end
    #nameが２１文字以上では登録できないこと
    it "is invalid with a name that has more than 21 characters" do
      user=build(:user,name: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("は20文字以内で入力してください")
    end
    #重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user=create(:user)
      another_user=build(:user,email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    #passwordが７文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters" do
      user=build(:user,password: "111111",password_confirmation: "111111")
      expect(user).to be_valid
    end
    #passwordが６文字以下では登録できないこと
    it "is invalid with a password that has less than 5 characters" do
      user=build(:user,password:"11111",password_confirmation:"11111")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end