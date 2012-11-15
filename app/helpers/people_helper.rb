module PeopleHelper
  def fill_discapacity_left_select(f)
    if @person.new_record?
      f.select("selectLeftD",options_for_select(Discapacity.order("name").all.collect { |cat| [cat.name, cat.id] }, @person.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeftD', :class=>"span7"})
    else
      @sql = "SELECT
              discapacities.name,
                  discapacities.id
              FROM
              discapacities
              WHERE discapacities.id not in (SELECT discapacity_id FROM discapacities_people WHERE person_id = #{@person.id})
              ORDER BY name
              "

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeftD",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeftD', :class=>"span7"})
      #f.select("selectLeft",options_for_select(Discapacity.order("name").all.collect { |cat| [cat.name, cat.id] }, @person.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft', :class=>"span7"})
    end
  end
  def fill_discapacity_right_select(f)
    if @person.new_record?
      f.select("selectRightD",{},{}, {:size => 6,:multiple=>true, :id=>'selectRightD', :class=>"span7"})
    else
      @sql = "SELECT
                discapacities.name,
                discapacities.id
              FROM
                public.discapacities_people,
                public.discapacities
              WHERE
                discapacities.id = discapacities_people.discapacity_id AND person_id = #{@person.id}
              ORDER BY name
              "

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectRightD",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectRightD', :class=>"span7"})
    end
  end
  def fill_functional_support_left_select(f)
    if @person.new_record?
      f.select("selectLeftFS",options_for_select(FunctionalSupport.order("name").all.collect { |cat| [cat.name, cat.id] }, @person.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeftFS', :class=>"span7"})
    else
      @sql = "SELECT
              functional_supports.name,
                  functional_supports.id
              FROM
              functional_supports
              WHERE functional_supports.id not in (SELECT functional_support_id FROM functional_supports_people WHERE person_id = #{@person.id})
              ORDER BY name
              "

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeftFS",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeftFS', :class=>"span7"})
      #f.select("selectLeft",options_for_select(Discapacity.order("name").all.collect { |cat| [cat.name, cat.id] }, @person.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft', :class=>"span7"})
    end
  end
  def fill_functional_support_right_select(f)
    if @person.new_record?
      f.select("selectRightFS",{},{}, {:size => 6,:multiple=>true, :id=>'selectRightFS', :class=>"span7"})
    else
      @sql = "SELECT
                functional_supports.name,
                functional_supports.id
              FROM
                public.functional_supports_people,
                public.functional_supports
              WHERE
                functional_supports.id = functional_supports_people.functional_support_id AND person_id = #{@person.id}
              ORDER BY name
              "

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectRightFS",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectRightFS', :class=>"span7"})
    end
  end
  def fill_documentation_left_select(f)
    if @person.new_record?
      f.select("selectLeftDo",options_for_select(Documentation.order("name").where("belongs = 1 or belongs = 3").collect { |cat| [cat.name, cat.id] }, @person.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeftDo', :class=>"span7"})
    else
      @sql = "SELECT
              documentations.name,
                  documentations.id
              FROM
              documentations
              WHERE documentations.id not in (SELECT documentation_id FROM documentations_people WHERE person_id = #{@person.id}) AND (belongs = 1 or belongs = 3)
              ORDER BY name
              "

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeftDo",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeftDo', :class=>"span7"})
      #f.select("selectLeft",options_for_select(Discapacity.order("name").all.collect { |cat| [cat.name, cat.id] }, @person.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft', :class=>"span7"})
    end
  end
  def fill_documentation_right_select(f)
    if @person.new_record?
      f.select("selectRightDo",{},{}, {:size => 6,:multiple=>true, :id=>'selectRightDo', :class=>"span7"})
    else
      @sql = "SELECT
                documentations.name,
                documentations.id
              FROM
                public.documentations_people,
                public.documentations
              WHERE
                documentations.id = documentations_people.documentation_id AND person_id = #{@person.id} AND (belongs = 1 or belongs = 3)
              ORDER BY name
              "

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectRightDo",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectRightDo', :class=>"span7"})
    end
  end
end
