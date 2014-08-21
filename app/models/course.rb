class Course < ActiveRecord::Base
  has_many :subjects,through: :course_subject
  has_and_belongs_to_many :users
  validates :name, :duration, presence:  true
  validates_uniqueness_of :name
end
