class CreateServiceRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :service_requests do |t|
      t.datetime :date_time
      t.string :service_area
      t.string :service_request
      t.string :latitude
      t.string :longitude
      t.references :Electoral_ward, null: false, foreign_key: true
      t.references :Neighbourhood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
