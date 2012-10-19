class CreateGuardianships < ActiveRecord::Migration
  def change
    create_table :guardianships do |t|
      t.string :name

      t.timestamps
    end
  end
end
