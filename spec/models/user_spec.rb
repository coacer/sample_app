require 'rails_helper'

RSpec.describe User, type: :model do

  context "can save user" do

    it "should be valid" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                               first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        expect(FactoryBot.build(:user, email: valid_address)).to be_valid
      end
    end
  end

  context "cannot save user" do

    it "name should be present" do
      expect(FactoryBot.build(:user, :blank_name)).to_not be_valid
    end

    it "email should be present" do
      expect(FactoryBot.build(:user, :blank_email)).to_not be_valid
    end

    it "name should not be too long" do
      expect(FactoryBot.build(:user, :too_long_name)).to_not be_valid
    end

    it "email should not be too long" do
      expect(FactoryBot.build(:user, :too_long_email)).to_not be_valid
    end

    it "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                 foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        expect(FactoryBot.build(:user, email: invalid_address)).to_not be_valid
      end
    end

    it "email addresses should be unique" do
      user = FactoryBot.create(:user) 
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      expect(duplicate_user).to_not be_valid
    end
    
    it "email addresses should be saved as lower-case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      user = FactoryBot.create(:user, email: mixed_case_email)
      expect(mixed_case_email.downcase).to eq user.reload.email
    end

    it "password should be present (nonblank)" do
      expect(FactoryBot.build(:user, :blank_password)).to_not be_valid
    end

    it "password should have a minimum length" do
      expect(FactoryBot.build(:user, :too_short_password)).to_not be_valid
    end
  end

end
