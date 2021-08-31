class AddRelationToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :name, :string
    add_column :admins, :name_kana, :string
  end
end
