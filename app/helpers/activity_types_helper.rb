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
      
      sumah = @activity_type.activities.sum((:qty_men), :conditions => ['activity_date_start >= ?', fechaini] )  
      acumuladoh = @activity_type.activities.sum((:qty_men), :conditions => ['activity_date_start >= ?', anioini] )
      sumam = @activity_type.activities.sum((:qty_women), :conditions => ['activity_date_start >= ?', fechaini] )  
      acumuladom = @activity_type.activities.sum((:qty_women), :conditions => ['activity_date_start >= ?', anioini] )
      #sumav = @activity_type.activities.sum((:value), :conditions => ['activity_date_start >= ?', fechaini] )  
      #acumuladov = @activity_type.activities.sum((:value), :conditions => ['activity_date_start >= ?', anioini] )
      
      @suma = sumah + sumam
      @acumulado = acumuladoh + acumuladom
     
  end
  
  
  
  
end
