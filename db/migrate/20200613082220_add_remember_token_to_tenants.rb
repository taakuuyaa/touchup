class AddRememberTokenToTenants < ActiveRecord::Migration[5.2]
  def up
    add_column :tenants, :remember_token, :string, after: :password_digest
    add_index  :tenants, :remember_token
  end

  def down
    remove_index  :tenants, :remember_token
    remove_column :tenants, :remember_token
  end
end
