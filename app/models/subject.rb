class Subject < ActiveRecord::Base
  has_many :chapters,dependent: :destroy
  has_many :courses,through: :course_subject

  validates :name, :author, presence:  true
  validates_uniqueness_of :name
end
