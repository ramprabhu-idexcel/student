require 'spec_helper'

describe User do
  describe "Model Validate methods" do
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:email) }
    it { should_not allow_value(nil).for(:first_name) }
    it { should_not allow_value(nil).for(:last_name) }
    it { should_not allow_value("").for(:email) }
    it { should_not allow_value("").for(:role) }

    it 'should validate user attributes' do
      user =  Fabricate(:user)
      expect(user.first_name).to eq("ram")
      expect(user.email).to eq("nramprabu@gmail.com")
      expect(user.phone_number).to eq("33333")
      expect(user.alternative_number).to eq("44444")
    end
  end

  describe 'Positive unit tests' do
    it 'valid user' do
      user = Fabricate(:user, first_name: "mani", last_name: "kumar",email: "mani@gmail.com",password: "test@123",password_confirmation: "test@123",role: "administrator", phone_number: "33333" )
      user.should be_valid
    end
  end

  describe 'Negative unit tests' do
    it "is invalid without a email" do
      user = Fabricate.build(:user, first_name: "rajesh", last_name: "kumar",email: "",password: "test@123",password_confirmation: "test@123",role: "administrator", phone_number: "33333" )
      user.should_not be_valid
    end

    it "is invalid without a firstname" do
      user = Fabricate.build(:user, first_name: "", last_name: "kumar",email: "",password: "test@123",password_confirmation: "test@123",role: "administrator", phone_number: "33333" )
      user.should_not be_valid
    end

    it "is invalid without a password" do
      user = Fabricate.build(:user, first_name: "rajesh", last_name: "kumar",email: "raj@gmail.com",password: "",password_confirmation: "",role: "administrator", phone_number: "33333" )
      user.should_not be_valid
    end

    it "is invalid without a role" do
      user = Fabricate.build(:user, first_name: "rajesh", last_name: "kumar",email: "raj@gmail.com",password: "test@123",password_confirmation: "test@123",role: "", phone_number: "33333" )
      user.should_not be_valid
    end
  end

end


