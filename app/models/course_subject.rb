class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  validates :course_id, :subject_id, presence:  true
  validates :course_id, uniqueness: {scope: :subject_id}
end
