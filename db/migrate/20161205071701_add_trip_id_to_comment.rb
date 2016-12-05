class AddTripIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :trip, foreign_key: true
  end
end
