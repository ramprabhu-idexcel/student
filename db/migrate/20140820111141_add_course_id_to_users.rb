class AddCourseIdToUsers < ActiveRecord::Migration
  def change
    create_table :courses_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :course
    end
    add_index :courses_users, [:user_id, :course_id]
  end
end
