require 'rails_helper'

describe User do
  describe '#create' do

    it "全ての項目の入力が存在すれば登録できること" do # テストしたいことの内容
      user = build(:user)  # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入
      expect(user).to be_valid # 変数userの情報で登録がされるかどうかのテストを実行
    end

    # nul:false, presence: true のテスト ▼

      it "nameがない場合は登録できないこと" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "encrypted_passwordがない場合は登録できないこと" do
        user = build(:user, encrypted_password: nil)
        user.valid?
        expect(user.errors[:encrypted_password]).to include("doesn't match Password")
      end

      # パスワードの文字数テスト ▼

      it "passwordが6文字以上であれば登録できること" do
        user = build(:user, password: "123456", encrypted_password: "123456")
        expect(user).to be_valid
      end

      it "passwordが6文字以下であれば登録できないこと" do
        user = build(:user, password: "123456", encrypted_password: "123456")
        user.valid?
        expect(user.errors[:encrypted_password]).to include("is too short")
      end

      # email 一意性制約のテスト ▼

      it "重複したemailが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      # 確認用パスワードが必要であるテスト ▼

      it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
        user = build(:user, encrypted_password: "")
        user.valid?
        expect(user.errors[:encrypted_password]).to include("doesn't match Password")
      end


  end
end