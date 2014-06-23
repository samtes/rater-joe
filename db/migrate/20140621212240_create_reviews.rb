class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :score
      t.text :remark
      t.string :role
      t.integer :institution_id
      t.integer :user_id

      t.timestamps
    end
  end
end
