class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :type
      t.integer :length
      t.string :role
      t.string :website

      t.timestamps
    end
  end
end
