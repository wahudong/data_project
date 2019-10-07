class CreateNeighbourhoods < ActiveRecord::Migration[6.0]
  def change
    create_table :neighbourhoods do |t|
      t.string :name
      t.string :school_division
      t.string :number_of_hospital
      t.string :integer

      t.timestamps
    end
  end
end
