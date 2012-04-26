class CreateSexennialStatePlanComponents < ActiveRecord::Migration
  def change
    create_table :sexennial_state_plan_components do |t|
      t.string  :title, :length => 300
      t.text    :description
      t.timestamps
    end
  end
end
