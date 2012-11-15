class AddCircunscriptionToJudicialDistrict < ActiveRecord::Migration
  def change
      change_table :judicial_districts do |t|
      t.string :circunscription
    end
  end
end
