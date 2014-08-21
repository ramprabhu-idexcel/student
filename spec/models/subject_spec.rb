require 'spec_helper'

describe Subject do
  describe "Model Validate methods" do
    it { should respond_to(:name) }
    it { should respond_to(:author) }
    it { should respond_to(:description) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:author) }
    it { should_not allow_value(nil).for(:name) }
    it { should_not allow_value(nil).for(:author) }
    it { should_not allow_value("").for(:name) }
    it { should_not allow_value("").for(:author) }

    it 'should validate subject attributes' do
      subject =  Fabricate(:subject)
      expect(subject.name).to eq("C programming")
      expect(subject.description).to eq("Programming Language")
      expect(subject.author).to eq("denis ritche")
    end
  end

  describe 'Positive unit tests' do
    it 'valid subject' do
      subject = Fabricate(:subject, name: "C++", description: "C++ Programming Language",author: "denis ritche" )
      subject.should be_valid
    end
  end

  describe 'Negative unit tests' do
    it "is invalid without name" do
      subject = Fabricate.build(:subject, name: nil, description: "electrical engineering",author: "denis ritche" )
      subject.should_not be_valid
    end

    it "is invalid without author" do
      subject = Fabricate.build(:subject, name: "Mach", description: "Machanical engineering",author: nil )
      subject.should_not be_valid
    end

    it "already existing subject name" do
      subject = Fabricate.build(:subject, name: "C++", description: "C++ Programming Language",author: "denis ritche" )
      subject.should_not be_valid
    end
  end

end


