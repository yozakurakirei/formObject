class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :place
      t.string :place_remark
      t.date :start
      t.date :finish
      t.time :time
      t.integer :salary
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
