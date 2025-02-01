class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.integer :status
      t.decimal :grade

      t.timestamps
    end
  end
end
