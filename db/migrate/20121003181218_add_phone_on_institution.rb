class AddPhoneOnInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :phone, :string
  end
end
