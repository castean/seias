class ReenameCountiesJudicalDistricts < ActiveRecord::Migration
    def change
      rename_table :counties_judical_districts, :counties_judicial_districts
    end
end
