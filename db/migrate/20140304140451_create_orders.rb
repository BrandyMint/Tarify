class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :tariffe, index: true, null: true
      t.string :phone, null: true
      t.string :name, null: true
      t.string :email, null: true
      t.string :state, null: true

      t.timestamps
    end
  end
end
