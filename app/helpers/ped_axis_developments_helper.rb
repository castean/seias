module PedAxisDevelopmentsHelper
  def fillrightleftselectionaxis(f)
    if @ped_axis_development.new_record?
      f.select("selectLeft",options_for_select(PedProgramDefinition.order("name").all.collect { |cat| [cat.name, cat.id] }, @ped_axis_development.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft'})
    else
      @sql = "Select name,id from ped_program_definitions where id not in (SELECT ped_program_definitions.id FROM ped_program_definitions INNER JOIN ped_axis_developments_ped_program_definitions
              ON ped_program_definitions.id = ped_axis_developments_ped_program_definitions.ped_axis_development_id
              WHERE ped_axis_developments_ped_program_definitions.ped_axis_development_id = " + @ped_axis_development.id.to_s + "ORDER BY name)"

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeft",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeft'})
    end
  end
end
