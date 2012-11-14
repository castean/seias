class AddPedProgramToPed < ActiveRecord::Migration
  def change
      change_table :peds do |t|
        t.text :ped_program
      end
  end
end
