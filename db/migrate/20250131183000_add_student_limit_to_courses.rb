class AddStudentLimitToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :student_limit, :integer, null: false, default: 30
  end
end
