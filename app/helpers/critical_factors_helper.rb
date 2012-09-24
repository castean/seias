module CriticalFactorsHelper

  def fillrightleftcatalogtable(f)
    if @critical_factor.new_record?

      f.select("selectLeft",{},{},{:multiple=>true, :size => 6, :id=>'selectLeft'})

    else
      tabla =  CatalogTable.find(@critical_factor.catalog_table_reference).table.to_s
      @sql = "Select name, id as proc_id from " + tabla + " WHERE id NOT IN
	           (SELECT " + tabla + ".id
               FROM public.catalog_tables_critical_factors, public.critical_factors, public.catalog_tables, public." + tabla + "
               WHERE critical_factors.id = catalog_tables_critical_factors.critical_factor_id
               AND catalog_tables.id = critical_factors.catalog_table_id
               AND " + tabla +  ".id = catalog_tables_critical_factors.catalog_table_id)"


      @ppal = ActiveRecord::Base.connection.select_rows(@sql)
      @ppal.map{|name,proc_id|}

      f.select("selectLeft",@ppal,{},{:multiple=>true, :size => 6, :id=>'selectLeft'})
    end
  end


  def selectrightfill(f)
    if @critical_factor.new_record?
      f.select("selectRight",{},{},{:multiple=>true, :size => 6, :id=>'selectRight'})
    else
      tabla =  CatalogTable.find(@critical_factor.catalog_table_reference).table.to_s
      sql = "SELECT " + tabla + ".name, " + tabla + ".id as proc_id
             FROM public.catalog_tables_critical_factors, public.critical_factors, public.catalog_tables, public." + tabla + "
             WHERE critical_factors.id = catalog_tables_critical_factors.critical_factor_id
             AND catalog_tables.id = critical_factors.catalog_table_id
             AND " + tabla +  ".id = catalog_tables_critical_factors.catalog_table_id
             AND catalog_tables_critical_factors.critical_factor_id = " + @critical_factor.id.to_s +  ";"


      ppal = ActiveRecord::Base.connection.select_rows(sql)
      ppal.map{|description,proc_id|}

      f.select("selectRight",ppal,{},{:multiple=>true, :size => 6, :id=>'selectRight'})
    end



  end
end
