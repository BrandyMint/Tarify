class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :title, null: false, unique: true
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
