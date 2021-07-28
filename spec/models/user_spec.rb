require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations:" do
    before(:each) do
    @user = User.new({first_name: 'Senay', last_name: 'Hailu', email: 'senay@gmail.com', password: "123456789", password_confirmation: "123456789"})
    end
    it "Saves to database if all fields are filled" do
      expect(@user.save).to eq true
    end
    it "Fails to save if first_name is not filled" do
      @user.first_name = nil
      expect(@user.save).to eq false
      expect(@user.errors.messages[:first_name]).to eq ["can't be blank"]
    end
    it "Fails to save if last_name is not filled" do
      @user.last_name = nil
      expect(@user.save).to eq false
      expect(@user.errors.messages[:last_name]).to eq ["can't be blank"]
    end
    it "Fails to save if email is not filled" do
      @user.email = nil
      expect(@user.save).to eq false
      expect(@user.errors.messages[:email]).to eq ["can't be blank"]
    end
    it "Fails to save if password is not filled" do
      @user.password = nil
      expect(@user.save).to eq false
      expect(@user.errors.messages[:password]).to eq ["can't be blank"]
    end
    it "Fails to save if password & password confirmation are not equal" do
      @user.password_confirmation = '123'
      expect(@user.save).to eq false
      expect(@user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
    end
    it "Fails to save if password length is less than 8 and above 20" do
      @user.password = '123'
      expect(@user.save).to eq false
      expect(@user.errors.messages[:password]).to eq ["is too short (minimum is 8 characters)"]
    end
  end

  describe '.authenticate_with_credentials' do
    it "Should check if email is unique" do
      @user1 = User.new({first_name: 'Simon', last_name: 'Haile', email: 'senay@gmail.com', password: "1234567890", password_confirmation: "1234567890"})
      @user1.save
      @user2 = User.new({first_name: 'Simon', last_name: 'Haile', email: 'senay@gmail.com', password: "1234567890", password_confirmation: "1234567890"})
      
      expect(@user2.save).to eq false

    
    end
  end

end


