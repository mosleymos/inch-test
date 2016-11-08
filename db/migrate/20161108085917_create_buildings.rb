class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.integer :reference, null: false
      t.string :address, null: true, default: "Unknow address"
      t.string :zip_code, null: true, default: "Unknow zip_code"
      t.string :city, null: true, default: "Unknow city"
      t.string :country, null: true, default: "Unknow country"
      t.string :manager_name, null: true, default: "Unknow manager_name" 

      t.timestamps
    end
  end
end
