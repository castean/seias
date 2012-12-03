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

  def obtenerdatosgenerales

    @sumtpubh = 0
    @sumtpubm = 0

    @sumtprivh = 0
    @sumtprivm = 0

    @sumelabh = 0
    @sumelabm = 0

    @sumeescolh = 0
    @sumeescolm = 0

    @totales = 0

    @totales = @institution.age_populations.sum(:total_qty_registered)

    @sumtpubh = @institution.age_populations.sum(:total_qty_registered, :conditions => {:guardianship_id => 1,:sex_id => 1})
    @sumtpubm = @institution.age_populations.sum(:total_qty_registered, :conditions => {:guardianship_id => 1,:sex_id => 2})

    @sumtprivh = @institution.age_populations.sum(:total_qty_registered, :conditions => {:guardianship_id => 2,:sex_id => 1})
    @sumtprivm = @institution.age_populations.sum(:total_qty_registered, :conditions => {:guardianship_id => 2,:sex_id => 2})

    @sumelabh = @institution.age_populations.sum(:total_qty_registered, :conditions => [ "(sex_id = ?) AND (age_range_id BETWEEN ? AND ?)", 1, 4, 13 ])
    @sumelabm = @institution.age_populations.sum(:total_qty_registered, :conditions => [ "(sex_id = ?) AND (age_range_id BETWEEN ? AND ?)", 2, 4, 13 ])

    #@sumeescolh = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 2, :sex_id => 1})
    @sumeescolh = @institution.age_populations.sum(:total_qty_registered, :conditions => [ "(sex_id = ?) AND (age_range_id BETWEEN ? AND ?)", 1, 2, 6 ])
    @sumeescolm = @institution.age_populations.sum(:total_qty_registered, :conditions => [ "(sex_id = ?) AND (age_range_id BETWEEN ? AND ?)", 2, 2, 6 ])
    #@sumeescolm = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 1,:sex_id => 2})


  end

  def obtenerdatos

    @sumah1 =0
    @sumam1 =0
    @sumat1 =0
    @sumah1 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 1,:sex_id => 1})
    @sumam1 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 1,:sex_id => 2})
    @sumat1 = @sumah1 + @sumam1

    @sumah2 =0
    @sumam2 =0
    @sumat2 =0
    @sumah2 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 2,:sex_id => 1})
    @sumam2 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 2,:sex_id => 2})
    @sumat2 = @sumah2 + @sumam2

    @sumah3 =0
    @sumam3 =0
    @sumat3 =0
    @sumah3 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 3,:sex_id => 1})
    @sumam3 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 3,:sex_id => 2})
    @sumat3 = @sumah3 + @sumam3

    @sumah4 =0
    @sumam4 =0
    @sumat4 =0
    @sumah4 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 4,:sex_id => 1})
    @sumam4 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 4,:sex_id => 2})
    @sumat4 = @sumah4 + @sumam4

    @sumah5 =0
    @sumam5 =0
    @sumat5 =0
    @sumah5 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 5,:sex_id => 1})
    @sumam5 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 5,:sex_id => 2})
    @sumat5 = @sumah5 + @sumam5

    @sumah6 =0
    @sumam6 =0
    @sumat6 =0
    @sumah6 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 6,:sex_id => 1})
    @sumam6 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 6,:sex_id => 2})
    @sumat6 = @sumah6 + @sumam6

    @sumah7 =0
    @sumam7 =0
    @sumat7 =0
    @sumah7 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 7,:sex_id => 1})
    @sumam7 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 7,:sex_id => 2})
    @sumat7 = @sumah7 + @sumam7

    @sumah8 =0
    @sumam8 =0
    @sumat8 =0
    @sumah8 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 8,:sex_id => 1})
    @sumam8 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 8,:sex_id => 2})
    @sumat8 = @sumah8 + @sumam8

    @sumah9 =0
    @sumam9 =0
    @sumat9 =0
    @sumah9 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 9,:sex_id => 1})
    @sumam9 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 9,:sex_id => 2})
    @sumat9 = @sumah9 + @sumam9

    @sumah10 =0
    @sumam10 =0
    @sumat10 =0
    @sumah10 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 10,:sex_id => 1})
    @sumam10 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 10,:sex_id => 2})
    @sumat10 = @sumah10 + @sumam10

    @sumah11 =0
    @sumam11 =0
    @sumat11 =0
    @sumah11 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 11,:sex_id => 1})
    @sumam11 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 11,:sex_id => 2})
    @sumat11 = @sumah11 + @sumam11

    @sumah12 =0
    @sumam12 =0
    @sumat12 =0
    @sumah12 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 12,:sex_id => 1})
    @sumam12 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 12,:sex_id => 2})
    @sumat12 = @sumah12 + @sumam12

    @sumah13 =0
    @sumam13 =0
    @sumat13 =0
    @sumah13 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 13,:sex_id => 1})
    @sumam13 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 13,:sex_id => 2})
    @sumat13 = @sumah13 + @sumam13

    @sumah14 =0
    @sumam14 =0
    @sumat14 =0
    @sumah14 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 14,:sex_id => 1})
    @sumam14 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 14,:sex_id => 2})
    @sumat14 = @sumah14 + @sumam14

    @sumah15 =0
    @sumam15 =0
    @sumat15 =0
    @sumah15 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 15,:sex_id => 1})
    @sumam15 = @institution.age_populations.sum(:total_qty_registered, :conditions => {:age_range_id => 15,:sex_id => 2})
    @sumat15 = @sumah15 + @sumam15
  end

  def obtenerdatosescolar

    @esumah1 =0
    @esumam1 =0
    @esumat1 =0
    @esumah1 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 1,:sex_id => 1})
    @esumam1 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 1,:sex_id => 2})
    @esumat1 = @esumah1 + @esumam1

    @esumah2 =0
    @esumam2 =0
    @esumat2 =0
    @esumah3 =0
    @esumam3 =0
    @esumat3 =0
    @esumah4 =0
    @esumam4 =0
    @esumat4 =0
    @esumah5 =0
    @esumam5 =0
    @esumat5 =0
    @esumah6 =0
    @esumam6 =0
    @esumat6 =0
    @esumah7 =0
    @esumam7 =0
    @esumat7 =0
    @esumah8 =0
    @esumam8 =0
    @esumat8 =0
    @esumah2 = @esumah3 + @esumah4 + @esumah5 + @esumah6 + @esumah7 + @esumah8
    @esumam2 = @esumam3 + @esumam4 + @esumam5 + @esumam6 + @esumam7 + @esumam8
    @esumat2 = @esumah2 + @esumam2


    @esumah3 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 3,:sex_id => 1})
    @esumam3 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 3,:sex_id => 2})
    @esumat3 = @esumah3 + @esumam3


    @esumah4 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 4,:sex_id => 1})
    @esumam4 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 4,:sex_id => 2})
    @esumat4 = @esumah4 + @esumam4


    @esumah5 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 5,:sex_id => 1})
    @esumam5 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 5,:sex_id => 2})
    @esumat5 = @esumah5 + @esumam5


    @esumah6 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 6,:sex_id => 1})
    @esumam6 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 6,:sex_id => 2})
    @esumat6 = @esumah6 + @esumam6


    @esumah7 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 7,:sex_id => 1})
    @esumam7 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 7,:sex_id => 2})
    @esumat7 = @esumah7 + @esumam7


    @esumah8 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 8,:sex_id => 1})
    @esumam8 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 8,:sex_id => 2})
    @esumat8 = @esumah8 + @esumam8

    @esumah9 =0
    @esumam9 =0
    @esumat9 =0
    @esumah10 =0
    @esumam10 =0
    @esumat10 =0
    @esumah11 =0
    @esumam11 =0
    @esumat11 =0
    @esumah12 =0
    @esumam12 =0
    @esumat12 =0

    @esumah9 = @esumah10 + @esumah11 + @esumah12
    @esumam9 = @esumam10 + @esumam11 + @esumam12
    @esumat9 = @esumah9 + @esumam9


    @esumah10 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 10,:sex_id => 1})
    @esumam10 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 10,:sex_id => 2})
    @esumat10 = @esumah10 + @esumam10


    @esumah11 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 11,:sex_id => 1})
    @esumam11 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 11,:sex_id => 2})
    @esumat11 = @esumah11 + @esumam11


    @esumah12 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 12,:sex_id => 1})
    @esumam12 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 12,:sex_id => 2})
    @esumat12 = @esumah12 + @esumam12

    @esumah13 =0
    @esumam13 =0
    @esumat13 =0
    @esumah13 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 13,:sex_id => 1})
    @esumam13 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 13,:sex_id => 2})
    @esumat13 = @esumah13 + @esumam13

    @esumah14 =0
    @esumam14 =0
    @esumat14 =0
    @esumah14 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 14,:sex_id => 1})
    @esumam14 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 14,:sex_id => 2})
    @esumat14 = @esumah14 + @esumam14

    @esumah15 =0
    @esumam15 =0
    @esumat15 =0
    @esumah15 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 15,:sex_id => 1})
    @esumam15 = @institution.school_ages.sum(:total_qty_registered, :conditions => {:grade_id => 15,:sex_id => 2})
    @esumat15 = @esumah15 + @esumam15
  end





end
