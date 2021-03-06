module ProgramsHelper
  def fillrightleftselection(f)
    if @program.new_record?
      f.select("selectLeft",options_for_select(PriorityProgramActionLine.order("name").all.collect { |cat| [cat.name, cat.id] }, @program.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft', :class=>"span7"})
    else
      @sql = "Select name,id from priority_program_action_lines where id not in (SELECT priority_program_action_lines.id FROM priority_program_action_lines INNER JOIN priority_program_action_lines_programs
              ON priority_program_action_lines.id = priority_program_action_lines_programs.priority_program_action_line_id
              WHERE priority_program_action_lines_programs.program_id = " + @program.id.to_s + ") ORDER BY name"

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeft",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeft', :class=>"span7"})
    end
  end
  def search_prog()
    userid = Direction.find_by_user_id(current_user)
    if userid.nil?
      select(:program_id, :program_id, Program.order("name").group("programs.id, programs.name,
      programs.description,programs.department_id,programs.responsable_id,programs.created_at,programs.updated_at,programs.direction_id,
      programs.cut_day,programs.program_start_date
      ").joins(:critical_success_factors => {:activity_types => :activities}).where("activities.user_id = :user_id
      ", :user_id => current_user).collect { |p| ["Programa No. " + p.name + " - " + p.description, p.id] })
    else
      select(:program_id, :program_id, Program.order("name").group("programs.id, programs.name,
      programs.description,programs.department_id,programs.responsable_id,programs.created_at,programs.updated_at,programs.direction_id,
      programs.cut_day,programs.program_start_date
      ").joins(:critical_success_factors => {:activity_types => :activities}).where("programs.department_id in (
      select id from departments where direction_id = (select id from directions where user_id = :user_id) )
      ", :user_id => current_user).collect { |p| ["Programa No. " + p.name + " - " + p.description, p.id] })
    end
  end

  def fillrightleftselectionusers(f)
    if @program.new_record?
      f.select("sLusers",options_for_select(User.order("name").all.collect { |cat| [cat.name + " " + cat.last_name + " " + cat.second_last_name, cat.id] }, @program.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'sLusers', :class=>"span7"})
    else
      @sql = "Select name || ' ' || last_name || ' ' || second_last_name as fullname,id from users where id not in (SELECT users.id FROM users INNER JOIN programs_users
              ON users.id = programs_users.user_id
              WHERE programs_users.program_id = " + @program.id.to_s + ") ORDER BY name, last_name, second_last_name"

      ppal = ActiveRecord::Base.connection.select_rows(@sql)
      ppal.map{|fullname,id|}

      f.select("sLusers",ppal,{},{:multiple=>true, :size => 6, :id=>'sLusers', :class=>"span7"})
    end
  end
  def selectrightfillusers(f)
    if @program.new_record?
      f.select("sRusers",{},{},{:multiple=>true, :size => 6, :id=>'sRusers', :class =>"span7"})
      #f.select("sLusers",options_for_select(PriorityProgramActionLine.order("name").all.collect { |cat| [cat.name, cat.id] }, @program.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'sLusers', :class=>"span7"})
    else
      @sql = "Select name || ' ' || last_name || ' ' || second_last_name as fullname, id from users where id in (SELECT programs_users.user_id FROM programs_users
              WHERE programs_users.program_id = " + @program.id.to_s + ") ORDER BY name, last_name, second_last_name"

      ppal = ActiveRecord::Base.connection.select_rows(@sql)
      ppal.map{|fullname,id|}

      f.select("sRusers",ppal,{},{:multiple=>true, :size => 6, :id=>'sRusers', :class =>"span7"})
    end
  end
end
