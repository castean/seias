class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :period
      t.integer :worth
      t.integer :benefit_category_id
      t.date :delivery_date
      t.integer :qty
      t.decimal :unit_price
      t.integer :affiliate_id

      t.timestamps
    end
  end
end
