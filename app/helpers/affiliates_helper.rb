module AffiliatesHelper
  def fill_programs_select(f)
    s = "SELECT
          programs.description,
          programs.id
        FROM
          public.programs_users,
          public.programs
        WHERE
          programs_users.program_id = programs.id AND programs_users.user_id = #{current_user.id};
        "
    p = ActiveRecord::Base.connection.select_rows(s)
    p.map{|description, id|}
    f.select :program_id, p, {:prompt => "Selecciona un Programa"}, :class=>"ddl_width"
  end
end
