class AddColumnTenants < ActiveRecord::Migration[5.2]
  def up
    add_column :tenants, :subdomain, :string, null: false, after: :name
    add_column :tenants, :email, :string, null: false, after: :subdomain
    add_column :tenants, :password_digest, :string, null: false, after: :email
    add_index :tenants, :subdomain, :unique => true
  end

  def down
    remove_index :tenants,  column: :subdomain
    remove_column :tenants, :subdomain, :string
    remove_column :tenants, :email, :string
    remove_column :tenants, :password_digest, :string
  end
end
