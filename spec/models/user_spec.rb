require 'rails_helper'

describe User do
  describe '#create' do
  
    it "is valid with a nickname, email, password" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = FactoryBot.create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a password that has less than 6 characters" do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    it "is valid with a password that has more than 7 characters" do
      user = build(:user, password: "0000000")
      expect(user).to be_valid
    end

  end

end