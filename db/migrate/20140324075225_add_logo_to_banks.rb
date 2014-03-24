class AddLogoToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :preview_id, :integer
  end
end
