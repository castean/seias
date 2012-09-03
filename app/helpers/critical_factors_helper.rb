module CriticalFactorsHelper
  def fillrightleftcatalogtable(f)
    if @critical_factor.new_record?

      f.select("selectLeft",{},{},{:multiple=>true, :size => 6, :id=>'selectLeft'})

    else
      c = @critical_factor.catalog_tables.all
      d = c[0].table
      @sql = "SELECT *  FROM "  +  d.to_s

      @ppal = ActiveRecord::Base.connection.select_rows(@sql)
      @ppal.map{|description,id|}

      f.select("selectLeft",@ppal,{},{:multiple=>true, :size => 6, :id=>'selectLeft'})
    end
  end


  def selectrightfill(f)

    f.select("selectRight",options_for_select(@critical_factor.catalog_tables.order("name").all.collect { |cat| [cat.name, cat.id] },
                                              @ppal),
                                              {}, {:size => 6,:multiple=>true, :id=>'selectRight'})

  end
end
