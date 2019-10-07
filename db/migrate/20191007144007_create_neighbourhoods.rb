class CreateNeighbourhoods < ActiveRecord::Migration[6.0]
  def change
    create_table :neighbourhoods do |t|
      t.string :name
      t.string :school_division
      t.integer :number_of_hospital

      t.timestamps
    end
  end
end
