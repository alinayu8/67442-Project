class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.float :longitude
      t.float :latitude
      t.datetime :end_time
      t.datetime :start_time
      t.string :notes

      t.timestamps
    end
  end
end
