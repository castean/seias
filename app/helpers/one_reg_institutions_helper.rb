module OneRegInstitutionsHelper
  def fillrightleftselectiononereginst(f)
    if @one_reg_institution.new_record?
      f.select("selectLeft",options_for_select(Discapacity.order("name").all.collect { |cat| [cat.name, cat.id] }, @one_reg_institution.id { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft', :class=>"span7"})
    else
      @sql = "Select name,id from priority_program_action_lines where id not in (SELECT priority_program_action_lines.id FROM priority_program_action_lines INNER JOIN priority_program_action_lines_programs
              ON priority_program_action_lines.id = priority_program_action_lines_programs.priority_program_action_line_id
              WHERE priority_program_action_lines_programs.program_id = " + @program.id.to_s + ") ORDER BY name"

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeft",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeft', :class=>"span7"})
    end
  end
  def filldocrightleftselectiononereginst(f)
    if @one_reg_institution.new_record?
      f.select("selectLefttwo",options_for_select(Documentation.order("name").all.collect { |cat| [cat.name, cat.id] }, @one_reg_institution.id { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLefttwo', :class=>"span7"})
    else
      @sql = "Select name,id from documentation where id not in (SELECT documentation.id FROM documentation INNER JOIN documentations_one_reg_institutions
              ON documentation.id = documentations_one_reg_institutions.documentation_id
              WHERE documentation_one_reg_institutions.institution_id = " + @one_reg_institution.id.to_s + ") ORDER BY name"

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLefttwo",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLefttwo', :class=>"span7"})
    end
  end
end
