class CreateComunas < ActiveRecord::Migration
  def change
    create_table :comunas do |t|
      t.string :name
      t.references :provin
      t.timestamps null: false
    end
  end
end
