class CreateElectoralWards < ActiveRecord::Migration[6.0]
  def change
    create_table :electoral_wards do |t|
      t.string :name
      t.string :mla_name
      t.string :mla_add

      t.timestamps
    end
  end
end
