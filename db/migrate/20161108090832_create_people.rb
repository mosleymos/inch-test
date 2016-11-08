class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.integer :reference, null: false
      t.string :email, null: true, default: "Unknow email"
      t.string :home_phone_number, null: true, default: "Unknow home_phone_number"
      t.string :mobile_phone_number, null: true, default: "000000"
      t.string :firstname, null: true, default: "Unknow firstname"
      t.string :lastname, null: true, default: "Unknow lastname"
      t.string :address, null: true, default: "Unknow address"

      t.timestamps
    end
  end
end
