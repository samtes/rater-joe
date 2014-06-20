class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :quality_of_instructors
      t.integer :length_of_instruction
      t.integer :content_of_instruction
      t.integer :quality_of_instruction
      t.integer :course_work
      t.string :remark
      t.integer :institution_id

      t.timestamps
    end
  end
end
