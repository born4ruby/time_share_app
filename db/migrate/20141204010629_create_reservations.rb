class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.date :preferred_housing_date
      t.text :additional_questions
      t.text :amenities, array: true, default: []

      t.timestamps
    end
  end
end
