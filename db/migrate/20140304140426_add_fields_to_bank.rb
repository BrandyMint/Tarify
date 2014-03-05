class AddFieldsToBank < ActiveRecord::Migration
  def change
    add_column :banks, :notification_email, :string
    add_column :banks, :notification_phone, :string
  end
end
