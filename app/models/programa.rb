class Programa 
 attr_accessor :descripcion, :nombre, :totalv, :hombre, :mujer,:totalp
 def initialize(descripcion, nombre, totalv, hombre, mujer, totalp)
  @descripcion = descripcion
  @nombre = nombre
  @totalv = totalv
  @hombre = hombre
  @mujer = mujer
  @totalp = totalp
 end
end