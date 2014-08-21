require 'spec_helper'

describe Chapter do
  describe "Model Validate methods" do
    it { should respond_to(:name) }
    it { should respond_to(:subject_id) }
    it { should respond_to(:description) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:subject_id) }
    it { should_not allow_value(nil).for(:name) }
    it { should_not allow_value(nil).for(:subject_id) }
    it { should_not allow_value("").for(:name) }
    it { should_not allow_value("").for(:subject_id) }

    it 'should validate chapter attributes' do
      chapter =  Fabricate(:chapter)
      expect(chapter.name).to eq("Pointers")
      expect(chapter.description).to eq("Programming Language")
      expect(chapter.subject_id).to eq(1)
    end
  end

  describe 'Positive unit tests' do
    it 'valid subject' do
      chapter = Fabricate(:chapter, name: "Arrays", description: "C++ Programming Language",subject_id: 1 )
      chapter.should be_valid
    end
  end

  describe 'Negative unit tests' do
    it "is invalid without name" do
      chapter = Fabricate.build(:chapter, name: nil, description: "C++ Programming Language",subject_id: 1 )
      chapter.should_not be_valid
    end

    it "is invalid without subject" do
      chapter = Fabricate.build(:chapter, name: "Structure", description: "C++ Programming Language",subject_id: nil )
      chapter.should_not be_valid
    end

    it "already existing chapter name" do
      chapter = Fabricate.build(:chapter, name: "Arrays", description: "C++ Programming Language",subject_id: 1 )
      chapter.should_not be_valid
    end
  end

end


