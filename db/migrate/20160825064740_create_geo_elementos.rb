class CreateGeoElementos < ActiveRecord::Migration[5.0]
  def change
    create_table :geo_elementos do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :tipo
      t.integer :votes

      t.references :users
      t.timestamps
    end
  end
end
