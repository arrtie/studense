class CreateCoursesStudentsAndTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.references :profile, null: false
      t.timestamps
    end

    create_table :instructors do |t|
      t.references :profile, null: false
      t.timestamps
    end

    create_table :courses do |t|
      t.string :name
      t.references :instructor, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
