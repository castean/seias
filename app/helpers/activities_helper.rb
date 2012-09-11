module ActivitiesHelper
  def fill_activity_type_select(f)
     if @activity.new_record?
         #sql = "Select distinct activity_types.name, activity_types.id from activity_types INNER JOIN activity_types_critical_success_factors ON activity_types_critical_success_factors.activity_type_id = activity_types.id
            #INNER JOIN critical_success_factors ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
            #INNER JOIN Programs ON programs.id = critical_success_factors.program_id INNER JOIN directions ON directions.id = programs.direction_id
            #WHERE programs.department_id = #{current_user.department_id}"
            sql = "Select activity_types.name, activity_types.id from activity_types"

      else
            #sql = "Select distinct activity_types.name, activity_types.id from activity_types INNER JOIN activity_types_critical_success_factors ON activity_types_critical_success_factors.activity_type_id = activity_types.id
            #INNER JOIN critical_success_factors ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
            #INNER JOIN Programs ON programs.id = critical_success_factors.program_id INNER JOIN directions ON directions.id = programs.direction_id
            #WHERE programs.direction_id = #{current_user.department.direction_id}"
            sql = "Select activity_types.name, activity_types.id from activity_types"
     end

     filter_activity_types = ActiveRecord::Base.connection.select_rows(sql)
     filter_activity_types.map{|name, id|}
     f.select :activity_type_id, filter_activity_types, {:prompt => '-- Seleciona el Tipo de Actividad --'}, {:id=>"tipo"}
  end
end
