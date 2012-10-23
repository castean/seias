class CreateDocumentationsPeople < ActiveRecord::Migration
  def change
    create_table :documentations_people, :id => false do |t|
          t.integer :documentation_id
          t.integer :person_id
        end
  end
end
