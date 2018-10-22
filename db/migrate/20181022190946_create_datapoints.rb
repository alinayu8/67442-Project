class CreateDatapoints < ActiveRecord::Migration[5.1]
  def change
    create_table :datapoints do |t|
      t.references :entry, foreign_key: true
      t.integer :value
      t.datetime :time

      t.timestamps
    end
  end
end
