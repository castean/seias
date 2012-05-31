class CreateStatisticalMaps < ActiveRecord::Migration
  def change
    create_table :statistical_maps do |t|

      t.timestamps
    end
  end
end
