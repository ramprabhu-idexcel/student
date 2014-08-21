require 'spec_helper'

describe CourseSubject do
  describe "Model Validate methods" do
    it { should respond_to(:subject_id) }
    it { should respond_to(:course_id) }
    it { should validate_presence_of(:subject_id) }
    it { should validate_presence_of(:course_id) }
    it { should_not allow_value(nil).for(:subject_id) }
    it { should_not allow_value(nil).for(:course_id) }
    it { should_not allow_value("").for(:subject_id) }
    it { should_not allow_value("").for(:course_id) }

    it 'should validate user attributes' do
      course_subject =  Fabricate(:CourseSubject,subject_id: 1, course_id: 1)
      expect(course_subject.subject_id).to eq(1)
      expect(course_subject.course_id).to eq(1)
    end
  end

  describe 'Positive unit tests' do
    it 'valid subject' do
      course_subject = Fabricate.build(:CourseSubject,subject_id: 2, course_id: 2)
      course_subject.should be_valid
    end
  end

  describe 'Negative unit tests' do
    it "is invalid without subject" do
      course_subject = Fabricate.build(:CourseSubject,subject_id: "", course_id: 2)
      course_subject.should_not be_valid
    end

    it "is invalid without course" do
      course_subject = Fabricate.build(:CourseSubject,subject_id: 2, course_id: nil)
      course_subject.should_not be_valid
    end
  end

end


