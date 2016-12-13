class AddOmiauthAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
    end
  end
end
