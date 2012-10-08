class DelPhoneOnInstitution < ActiveRecord::Migration
  def up
    remove_column :institutions, :phone
  end

  def down
    add_column :institutions, :phone, :string
  end
end
