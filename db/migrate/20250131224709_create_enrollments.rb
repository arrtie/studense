class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_join_table :courses, :students, table_name: :enrollments do |t|
      t.index :student_id
      t.index :course_id
      t.string :status
      t.decimal :grade

      t.timestamps
    end
  end
end
