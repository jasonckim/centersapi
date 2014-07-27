class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :lat
      t.string :longit
      t.string :url
      t.text :info
      t.string :phone

      t.timestamps
    end
  end
end
