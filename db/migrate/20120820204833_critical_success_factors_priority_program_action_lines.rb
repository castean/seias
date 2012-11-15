class CriticalSuccessFactorsPriorityProgramActionLines < ActiveRecord::Migration
  def change
    create_table :critical_success_factors_priority_program_action_lines , :id => false do |t|
      t.integer :priority_program_action_line_id
      t.integer :critical_success_factor_id
    end
  end
end
