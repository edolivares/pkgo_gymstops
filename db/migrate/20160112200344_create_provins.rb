class CreateProvins < ActiveRecord::Migration
  def change
    create_table :provins do |t|
      t.string :name
      t.references :region
      t.timestamps null: false
    end
  end
end
