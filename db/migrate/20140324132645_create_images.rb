class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file, null: false
      t.text :description
      t.string :resource_type, null: false
      t.integer :resource_id, null: false

      t.timestamps
    end
  end
end
