class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name,                :null => false
      t.string    :email,               :null => false, :length => 320
      t.string    :login,               :null => false
      t.string    :last_name
      t.string    :second_last_name

      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false

      # Magic columns, just like ActiveRecord's created_at and updated_at.
      # These are automatically maintained by Authlogic if they are present.
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      #Users need to be active
      t.boolean   :active, :default => false, :null => false

      t.timestamps
    end
  end
end
