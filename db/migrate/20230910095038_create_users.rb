class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :mobile_number
      t.string :country_code
      t.string :email
      t.string :gender
      t.date :date_of_birth
      t.string :role
      t.string :otp_code
      t.string :auth_token
      t.boolean :is_active
      t.jsonb :verify_details
      t.timestamps
    end
  end
end
