class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffes do |t|
      t.boolean :active, default: true, null: false
      t.references :bank, index: true
      t.integer :position, null: false, default: 0
      t.string :title, null: false
      t.float :month_fee
      t.float :invoice_fee
      t.float :cashing_fee
      t.text :summary
      t.string :pdf
      t.text :description
      t.string :invoice_tips

      t.timestamps
    end
  end
end
