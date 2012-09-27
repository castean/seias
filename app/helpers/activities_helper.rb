module ActivitiesHelper

  def fill_activity_type_select(f)
     if @activity.new_record?
         #sql = "Select distinct activity_types.name, activity_types.id from activity_types INNER JOIN activity_types_critical_success_factors ON activity_types_critical_success_factors.activity_type_id = activity_types.id
          #  INNER JOIN critical_success_factors ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
           # INNER JOIN Programs ON programs.id = critical_success_factors.program_id INNER JOIN directions ON directions.id = programs.direction_id
            #WHERE programs.department_id = #{current_user.department_id} order by activity_types.name"
            #sql = "Select activity_types.name, activity_types.id from activity_types"
        f.select :activity_type_id, {}, {:prompt => '-- Seleciona el Tipo de Actividad --'}, {:id=>"tipo", :class=>"ddl_width"}
     else


            pro = "Select MAX(programs.id) from activity_types INNER JOIN activity_types_critical_success_factors ON activity_types_critical_success_factors.activity_type_id = activity_types.id
            INNER JOIN critical_success_factors ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
            INNER JOIN Programs ON programs.id = critical_success_factors.program_id INNER JOIN directions ON directions.id = programs.direction_id
            WHERE  activity_types.id = #{@activity.activity_type_id}"

            sql = "Select distinct activity_types.name, activity_types.id from activity_types INNER JOIN activity_types_critical_success_factors ON activity_types_critical_success_factors.activity_type_id = activity_types.id
            INNER JOIN critical_success_factors ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
            INNER JOIN Programs ON programs.id = critical_success_factors.program_id INNER JOIN directions ON directions.id = programs.direction_id
            WHERE programs.id = #{Program.find(ActiveRecord::Base.connection.select_value(pro)).id} order by activity_types.name"
            #sql = "Select activity_types.name, activity_types.id from activity_types"
            filter_activity_types = ActiveRecord::Base.connection.select_rows(sql)
            filter_activity_types.map{|name, id|}
            f.select :activity_type_id, filter_activity_types, {:prompt => '-- Seleciona el Tipo de Actividad --'}, {:id=>"tipo", :class=>"ddl_width"}
     end
  end
  def fill_programs_select(f)
    s = "SELECT
                  programs.description,
                  programs.id
                FROM
                  public.programs,
                  public.critical_success_factors,
                  public.activity_types_critical_success_factors,
                  public.activity_types
                WHERE
                  critical_success_factors.program_id = programs.id AND
                  activity_types_critical_success_factors.critical_success_factor_id = critical_success_factors.id AND
                  activity_types.id = activity_types_critical_success_factors.activity_type_id AND
                  activity_types.id = #{@activity.activity_type_id}

                UNION

                SELECT
                DISTINCT
                  programs.description,
                  programs.id
                FROM
                  public.programs,
                  public.critical_success_factors,
                  public.activity_types_critical_success_factors,
                  public.activity_types
                WHERE
                  critical_success_factors.program_id = programs.id AND
                  activity_types_critical_success_factors.critical_success_factor_id = critical_success_factors.id AND
                  activity_types.id = activity_types_critical_success_factors.activity_type_id AND
                  programs.department_id = #{current_user.department_id} AND programs.id <>   (SELECT
                  MAX(programs.id)
                  FROM
                  public.programs,
                  public.critical_success_factors,
                  public.activity_types_critical_success_factors,
                  public.activity_types
                WHERE
                  critical_success_factors.program_id = programs.id AND
                  activity_types_critical_success_factors.critical_success_factor_id = critical_success_factors.id AND
                  activity_types.id = activity_types_critical_success_factors.activity_type_id AND
                  activity_types.id = #{@activity.activity_type_id})"
    p = ActiveRecord::Base.connection.select_rows(s)
    p.map{|description, id|}
    f.select :program_id, p, {:prompt => false}, :class=>"ddl_width"
  end
end
