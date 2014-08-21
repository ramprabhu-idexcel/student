module ChaptersHelper
  def subject_name(id)
    Subject.find(id).try(:name)
  end

  def course_name(id)
    Course.find(id).try(:name)
  end
end
