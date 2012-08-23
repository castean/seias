module CriticalSuccessFactorsHelper
  def fillrightleftselection(f)
    if @critical_success_factor.new_record?
      f.select("selectLeft",options_for_select(PriorityProgramActionLine.order("name").all.collect { |cat| [cat.name, cat.id] }, @critical_success_factor.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft'})
    else
      @sql = "Select name,id from critical_success_factors where id not in (SELECT priority_program_action_lines.id FROM priority_program_action_lines INNER JOIN priority_program_action_lines_programs
              ON priority_program_action_lines.id = priority_program_action_lines_programs.priority_program_action_line_id
              WHERE priority_program_action_lines_programs.program_id = " + @program.id.to_s + "ORDER BY name)"

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeft",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeft'})
    end
  end
end
