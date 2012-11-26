class CreateOfficeBenefitRequesteds < ActiveRecord::Migration
  def change
    create_table :office_benefit_requesteds do |t|
      t.integer :office_id
      t.integer :benefit_type_id
      t.integer :qty_requested

      t.timestamps
    end
  end
end
