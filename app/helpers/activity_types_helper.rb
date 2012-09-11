module ActivityTypesHelper
  def obtenervalores
    
      @annio = Date.today.year
      @mes = Date.today.strftime("%B")
      dia = Date.today.day
      #fecha = Date.today.strftime("%D")
      fecha = Date.today
      fechaini = (fecha - (dia-1))
      dayofyear = Date.today.yday
      anioini = (fecha - (dayofyear-1)) 
      
      @sumah = @activity_type.activities.sum((:qty_men), :conditions => ['activity_date_start >= ?', fechaini] )
      @acumuladoh = @activity_type.activities.sum((:qty_men), :conditions => ['activity_date_start >= ?', anioini] )
      @sumam = @activity_type.activities.sum((:qty_women), :conditions => ['activity_date_start >= ?', fechaini] )
      @acumuladom = @activity_type.activities.sum((:qty_women), :conditions => ['activity_date_start >= ?', anioini] )
      #sumav = @activity_type.activities.sum((:value), :conditions => ['activity_date_start >= ?', fechaini] )  
      #acumuladov = @activity_type.activities.sum((:value), :conditions => ['activity_date_start >= ?', anioini] )
      
      @suma = @sumah + @sumam
      @acumulado = @acumuladoh + @acumuladom
     
  end

  def fillrightleftselectionactivity(f)
    if @activity_type.new_record?
      f.select("selectLeft",options_for_select(CriticalSuccessFactor.order("title").all.collect { |cat| [cat.title, cat.id] }, @activity_type.name { |cat| cat.id}),{},{:multiple=>true, :size => 6, :id=>'selectLeft'})
      #f.select("selectLeft",options_for_select(PriorityProgramActionLine.order("name").all.collect { |cat| [cat.name, cat.id] }, @program.name { |cat| cat.id}),{}, {:size => 6,:multiple=>true, :id=>'selectLeft'})
    else
      @sql = "Select title,id from critical_success_factors where id not in (SELECT critical_success_factors.id FROM critical_success_factors INNER JOIN activity_types_critical_success_factors
              ON critical_success_factors.id = activity_types_critical_success_factors.critical_success_factor_id
              WHERE activity_types_critical_success_factors.activity_type_id = " + @activity_type.id.to_s + "ORDER BY title)"

      @t = ActiveRecord::Base.connection.select_rows(@sql)

      f.select("selectLeft",options_for_select(@t),{},{:multiple=>true, :size => 6, :id=>'selectLeft'})
    end
  end
  
  
end
