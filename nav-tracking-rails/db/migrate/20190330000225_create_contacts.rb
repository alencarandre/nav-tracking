class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false, limit: 100
      t.string :email, null: false, limit: 100

      t.timestamps
    end
  end
end
