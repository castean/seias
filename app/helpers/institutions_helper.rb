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

  def obtenerdatos

    @sumah1 =0
    @sumam1 =0
    @sumat1 =0
    @sumah1 = @institution.age_populations.sum(:total_qty_registered, :conditions => ['age_range_id = ?',1], :conditions => ['sex_id = ?',1])
    @sumam1 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',1]and['sex_id = ?',2]))
    @sumat1 = @sumah1 + @sumam1

    @sumah2 =0
    @sumam2 =0
    @sumat2 =0
    @sumah2 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',2]and['sex_id = ?',1]))
    @sumam2 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',2]and['sex_id = ?',2]))
    @sumat2 = @sumah2 + @sumam2

    @sumah3 =0
    @sumam3 =0
    @sumat3 =0
    @sumah3 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',3]and['sex_id = ?',1]))
    @sumam3 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',3]and['sex_id = ?',2]))
    @sumat3 = @sumah3 + @sumam3

    @sumah4 =0
    @sumam4 =0
    @sumat4 =0
    @sumah4 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',4]and['sex_id = ?',1]))
    @sumam4 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',4]and['sex_id = ?',2]))
    @sumat4 = @sumah4 + @sumam4

    @sumah5 =0
    @sumam5 =0
    @sumat5 =0
    @sumah5 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',5]and['sex_id = ?',1]))
    @sumam5 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',5]and['sex_id = ?',2]))
    @sumat5 = @sumah5 + @sumam5

    @sumah6 =0
    @sumam6 =0
    @sumat6 =0
    @sumah6 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',6]and['sex_id = ?',1]))
    @sumam6 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',6]and['sex_id = ?',2]))
    @sumat6 = @sumah6 + @sumam6

    @sumah7 =0
    @sumam7 =0
    @sumat7 =0
    @sumah7 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',7]and['sex_id = ?',1]))
    @sumam7 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',7]and['sex_id = ?',2]))
    @sumat7 = @sumah7 + @sumam7

    @sumah8 =0
    @sumam8 =0
    @sumat8 =0
    @sumah8 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',8]and['sex_id = ?',1]))
    @sumam8 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',8]and['sex_id = ?',2]))
    @sumat8 = @sumah8 + @sumam8

    @sumah9 =0
    @sumam9 =0
    @sumat9 =0
    @sumah9 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',9]and['sex_id = ?',1]))
    @sumam9 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',9]and['sex_id = ?',2]))
    @sumat9 = @sumah9 + @sumam9

    @sumah10 =0
    @sumam10 =0
    @sumat10 =0
    @sumah10 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',10]and['sex_id = ?',1]))
    @sumam10 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',10]and['sex_id = ?',2]))
    @sumat10 = @sumah10 + @sumam10

    @sumah11 =0
    @sumam11 =0
    @sumat11 =0
    @sumah11 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',11]and['sex_id = ?',1]))
    @sumam11 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',11]and['sex_id = ?',2]))
    @sumat11 = @sumah11 + @sumam11

    @sumah12 =0
    @sumam12 =0
    @sumat12 =0
    @sumah12 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',12]and['sex_id = ?',1]))
    @sumam12 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',12]and['sex_id = ?',2]))
    @sumat12 = @sumah12 + @sumam12

    @sumah13 =0
    @sumam13 =0
    @sumat13 =0
    @sumah13 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',13]and['sex_id = ?',1]))
    @sumam13 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',13]and['sex_id = ?',2]))
    @sumat13 = @sumah13 + @sumam13

    @sumah14 =0
    @sumam14 =0
    @sumat14 =0
    @sumah14 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',14]and['sex_id = ?',1]))
    @sumam14 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',14]and['sex_id = ?',2]))
    @sumat14 = @sumah14 + @sumam14

    @sumah15 =0
    @sumam15 =0
    @sumat15 =0
    @sumah15 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',15]and['sex_id = ?',1]))
    @sumam15 = @institution.age_populations.sum(:total_qty_registered, :conditions => (['age_range_id = ?',15]and['sex_id = ?',2]))
    @sumat15 = @sumah15 + @sumam15
  end





end
