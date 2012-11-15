class AddOfficeIdToAffiliates < ActiveRecord::Migration
  def change
    add_column :affiliates, :office_id, :integer
  end
end
