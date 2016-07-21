class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :type
      t.string :image
      t.string :data
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
