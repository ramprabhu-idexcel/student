class Chapter < ActiveRecord::Base
  belongs_to :subject
  validates :name, :subject_id, presence:  true
  validates_uniqueness_of :name
end
