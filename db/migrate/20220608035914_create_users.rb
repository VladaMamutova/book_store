class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false
      # The password field is called 'password_digest',
      # because this is a convention that the Bcrypt library
      # is looking for to know that it will be responsible
      # for digesting the password and encrypting it.
      t.string :password_digest, null: false
      t.boolean :is_admin, null: false

      t.timestamps
    end
  end
end
