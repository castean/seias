class CreateDocumentations < ActiveRecord::Migration
  def change
    create_table :documentations do |t|
      t.string :name
      t.integer :belongs

      t.timestamps
    end
  end
end
