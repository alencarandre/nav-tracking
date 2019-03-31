class ChangeContactFieldEmailDataTypeToCitext < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :email, :citext
  end
end
