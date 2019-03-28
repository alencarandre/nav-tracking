class CreateTrackings < ActiveRecord::Migration[5.2]
  def change
    create_table :trackings do |t|
      t.citext :guid, null: false
      t.citext :location, null: false
      t.datetime :accessed_at, null: false

      t.timestamps

      t.index ["guid", "location", "accessed_at"], unique: true
    end
  end
end
