module InstitutionsHelper
  def fillrightleftselectioninstitution(f)
    if @institution.new_record?
      f.select("selectLeft",options_for_select(Institution.order("name").all.collect { |cat| [cat.name, cat.id] }, @institution.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft', :class=>"span7"})
    else
      @sql = "Select name,id from institutions where id <> " + params[:id].to_s

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeft",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeft', :class=>"span7"})
    end
  end
  def selectrightfillinstitutions(f)
    if @institution.new_record?
      f.select("selectRight",{},{},{:multiple=>true, :size => 6, :id=>'selectRight', :class =>"span7"})
    else
      sql = "Select name,id from institutions, father_institutions
             Where father_institutions.father_institution_id = institutions.id
             And father_institutions.institution_id = " + params[:id]

      ppal = ActiveRecord::Base.connection.select_rows(sql)
      ppal.map{|name,id|}

      f.select("selectRight",ppal,{},{:multiple=>true, :size => 6, :id=>'selectRight', :class =>"span7"})
    end
  end
end
