class AddNewColumnToAdminSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_searches, :title, :string
    add_column :admin_searches, :author, :string
    add_column :admin_searches, :isbn, :string
  end
end
