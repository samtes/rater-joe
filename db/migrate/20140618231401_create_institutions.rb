class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :type
      t.integer :length
      t.string :measure
      t.string :website
      t.integer :user_id

      t.timestamps
    end
  end
end
