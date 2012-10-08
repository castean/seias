class CreateBusinessLines < ActiveRecord::Migration
  def change
    create_table :business_lines do |t|
      t.string :name

      t.timestamps
    end
  end
end
