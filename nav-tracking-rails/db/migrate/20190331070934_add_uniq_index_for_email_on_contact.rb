class AddUniqIndexForEmailOnContact < ActiveRecord::Migration[5.2]
  def change
    add_index :contacts, [:email], unique: true
  end
end
