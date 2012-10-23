class CreateFunctionalSuportsPeople < ActiveRecord::Migration
  def change
    create_table :functional_supports_people, :id => false do |t|
      t.integer :functional_support_id
      t.integer :person_id
    end
  end
end
