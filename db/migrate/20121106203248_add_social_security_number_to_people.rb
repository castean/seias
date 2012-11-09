class AddSocialSecurityNumberToPeople < ActiveRecord::Migration
  def change
    add_column :people, :social_security_number, :string
  end
end
