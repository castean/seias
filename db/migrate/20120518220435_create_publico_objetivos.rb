class CreatePublicoObjetivos < ActiveRecord::Migration
  def change
    create_table :publico_objetivos do |t|
      t.string :nombre
      t.string :descripcion
      
      t.timestamps
    end
  end
end
 