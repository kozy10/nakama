class AddConfirmationToUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :activation_digest, :string
  	remove_column :users, :activated, :boolean
  	remove_column :users, :activated_at, :datetime
  	add_column :users, :confirmation_token, :string
  	add_column :users, :confirmed_at, :datetime
  	add_column :users, :confirmation_sent_at, :datetime
  	add_column :users, :unconfirmed_email, :string
  end
end
