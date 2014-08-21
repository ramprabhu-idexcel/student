require 'spec_helper'

describe Course do
  describe "Model Validate methods" do
    it { should respond_to(:name) }
    it { should respond_to(:duration) }
    it { should respond_to(:description) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:duration) }
    it { should_not allow_value(nil).for(:name) }
    it { should_not allow_value(nil).for(:duration) }
    it { should_not allow_value("").for(:name) }
    it { should_not allow_value("").for(:duration) }

    it 'should validate course attributes' do
      course =  Fabricate(:course)
      expect(course.name).to eq("CSE")
      expect(course.description).to eq("Computer programming")
      expect(course.duration).to eq(1)
    end
  end

  describe 'Positive unit tests' do
    it 'valid course' do
      course = Fabricate(:course, name: "ECE", description: "electrical engineering",duration: "1" )
      course.should be_valid
    end
  end

  describe 'Negative unit tests' do
    it "is invalid without name" do
      course = Fabricate.build(:course, name: nil, description: "electrical engineering",duration: "1" )
      course.should_not be_valid
    end

    it "is invalid without duration" do
      course = Fabricate.build(:course, name: "IT", description: "electrical engineering",duration: "" )
      course.should_not be_valid
    end

    it "duplicate course name" do
      course = Fabricate.build(:course, name: "ECE", description: "electrical engineering",duration: "1" )
      course.should_not be_valid
    end

    it "duration should accept only integer" do
      course = Fabricate.build(:course, name: "ECE", description: "electrical engineering",duration: nil )
      course.should_not be_valid
    end
  end

end


