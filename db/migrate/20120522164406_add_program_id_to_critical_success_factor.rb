class AddProgramIdToCriticalSuccessFactor < ActiveRecord::Migration
  def self.up
    add_column :critical_success_factors, :program_id, :integer
  end
end
