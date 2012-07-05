// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
// Loads all Bootstrap javascripts
//= require bootstrap

// Ing. César Reyes // Esta Funcion es para el manejo de los dropdownlist

$(document).ready(function(){
	// Ing. César Reyes // direccion - departamento
        $("select#program_direction_id").change(function(){
            var id_value_string = $(this).val();
            if (id_value_string == "") {
                // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
                $("select#program_department_id option").remove();
                var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                $(row).appendTo("select#program_department_id");
                //alert("Failed to submit : Vacio  c");
            }
            else {
                // Send the request and update sub category dropdown
                
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/departments/for_directionid/' + id_value_string,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){   
                    	//alert("Failed to submit : Llenando c");                 
                        // Clear all options from sub category select
                        $("select#program_department_id option").remove();
                        //put in a empty default line
                        var row = "<option value=\"" + "0" + "\">" + "-- Seleciona el Departamento --" + "</option>";
                        $(row).appendTo("select#program_department_id");                        
                        // Fill sub category select
                        $.each(data, function(i, j){
                        	row = "<option value=\"" + j.id + "\">" + j.name + "</option>";  
                            $(row).appendTo("select#program_department_id");                    
                        });            
                     }
                });
            };
                });

     // Ing. César Reyes // ciudades y localidades


        $("#county_id").change(function(){
            var id_value_string = $(this).val();
            if (id_value_string == "") {
                // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
                $("#town_id option").remove();
                var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                $(row).appendTo("#town_id");
                //alert("Failed to submit : Vacio  c");
            }
            else {
                // Send the request and update sub category dropdown
               // window.location = "../get_maps_by_town/" + id_value_string
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/departments/for_countyid/' + id_value_string,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){   
          
                        // Clear all options from sub category select
                        $("#town_id option").remove();
                        //put in a empty default line
                        var row = "<option value=\"" + "0" + "\">" + "-- Seleciona la Localidad --" + "</option>";
                        $(row).appendTo("#town_id");                        
                        // Fill sub category select
                        $.each(data, function(i, j){
                        	row = "<option value=\"" + j.id + "\">" + j.name + "</option>";  
                            $(row).appendTo("#town_id");                    
                        });            
                     }
                });
            };
                });
    });

//
