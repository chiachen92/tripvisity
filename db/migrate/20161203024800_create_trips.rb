class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :destination
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
