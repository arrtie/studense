class RemoveDefaultFromCourseStudentLimit < ActiveRecord::Migration[8.0]
  def change
    change_column :courses, :student_limit, :integer, null: false
  end
end
