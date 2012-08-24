module CriticalSuccessFactorsHelper
  def fillrightleftcriticalactionline(f)
    if @critical_success_factor.new_record?
      sql = "SELECT priority_program_action_lines.name, priority_program_action_lines.id  FROM priority_program_action_lines"

      ppal = ActiveRecord::Base.connection.select_rows(sql)
      ppal.map{|name,id|}

      f.select("selectLeft",ppal,{},{:multiple=>true, :size => 6, :id=>'selectLeft'})

    else
      @sql = "Select name,id from priority_program_action_lines WHERE id NOT IN
	 (SELECT critical_success_factors_priority_program_action_lines.priority_program_action_line_id FROM critical_success_factors_priority_program_action_lines
	 INNER JOIN priority_program_action_lines ON priority_program_action_lines.id = critical_success_factors_priority_program_action_lines.priority_program_action_line_id
	 AND critical_success_factors_priority_program_action_lines.critical_success_factor_id = " + params[:id].to_s + ")
   AND id IN (SELECT priority_program_action_lines_programs.priority_program_action_line_id FROM priority_program_action_lines_programs
   WHERE priority_program_action_lines_programs.program_id =" + :program_id.to_s + ")"

      ppal = ActiveRecord::Base.connection.select_rows(@sql)
      ppal.map{|name,id|}

      f.select("selectLeft",ppal,{},{:multiple=>true, :size => 6, :id=>'selectLeft'})
    end
  end
end
