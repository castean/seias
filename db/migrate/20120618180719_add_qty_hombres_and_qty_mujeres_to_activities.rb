class AddQtyHombresAndQtyMujeresToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.integer :qty_men
      t.integer :qty_women
    end
  end
end
