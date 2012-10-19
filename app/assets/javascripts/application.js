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
                    url:  application_root_path() + '/departments/for_directionid/' + id_value_string,
                    timeout: 20000,
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
            }
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
                    url: application_root_path() + '/towns/for_countyid/' + id_value_string,
                    timeout: 20000,
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

            }
        });

    // Ing. César Reyes // ciudades y localidades


    $("#birth_county_id").change(function(){
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            $("#birth_town_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("#birth_town_id");
            //alert("Failed to submit : Vacio  c");
        }
        else {
            // Send the request and update sub category dropdown
            // window.location = "../get_maps_by_town/" + id_value_string
            $.ajax({
                dataType: "json",
                cache: false,
                url: application_root_path() + '/towns/for_countyid/' + id_value_string,
                timeout: 20000,
                error: function(XMLHttpRequest, errorTextStatus, error){
                    alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                },
                success: function(data){

                    // Clear all options from sub category select
                    $("#birth_town_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "0" + "\">" + "-- Seleciona la Localidad --" + "</option>";
                    $(row).appendTo("#birth_town_id");
                    // Fill sub category select
                    $.each(data, function(i, j){
                        row = "<option value=\"" + j.id + "\">" + j.name + "</option>";
                        $(row).appendTo("#birth_town_id");
                    });
                }
            });

        }
    });


    // Ing. César Reyes // Programas - Lineas de Accion


        $("#program_id").change(function(){
            var id_value_string = $(this).val();
            if (id_value_string == "") {
                // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
                $("#selectLeft option").remove();
                var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                $(row).appendTo("#selectLeft");
                //alert("Failed to submit : Vacio  c");
            }
            else {
                // Send the request and update sub category dropdown
               // window.location = "../get_maps_by_town/" + id_value_string
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url:  application_root_path() + '/activities/for_programid/' + id_value_string,
                    timeout: 20000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : " + id_value_string + errorTextStatus+" ;"+error );
                    },
                    success: function(data){   
          
                        // Clear all options from sub category select
                        $("#selectLeft option").remove();
                        //put in a empty default line
                        var row = "";
                        $(row).appendTo("#selectLeft");                        
                        // Fill sub category select
                        $.each(data, function(i, j){
                        	row = "<option value=\"" + j[1] + "\">" + j[0] + "</option>";  
                            $(row).appendTo("#selectLeft");                    
                        });            
                     }
                });
            };
                });





    // Ing. Antonio // indicador - catalogo de tablas


    $("#catalog_table_id").change(function(){
        var id_value_string = $(this).val();
        var ruta = "";
        switch (id_value_string)
        {
            case "1":
                ruta="peds/for_catalog_table_id/";
                break;
            case "2":
                ruta="priority_program_action_lines/for_catalog_table_id/";
                break;
            case "3":
                ruta="programs/for_catalog_table_id/";
                break;
            case "4":
                ruta="critical_success_factors/for_catalog_table_id/";
                break;
            case "5":
                ruta="activity_types/for_catalog_table_id/";
                break;
        }
        if (id_value_string == "") {
            // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            $("#selectLeft option").remove();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("#selectLeft");
            //alert("Failed to submit : Vacio  c");
        }
        else {
            // Send the request and update sub category dropdown
            // window.location = "../get_maps_by_town/" + id_value_string
            $.ajax({
                dataType: "json",
                cache: false,
                url:  "../" + application_root_path() + ruta + id_value_string,
                timeout: 20000,
                error: function(XMLHttpRequest, errorTextStatus, error){
                    alert("Failed to submit : " + id_value_string + errorTextStatus+" ;"+error );
                },
                success: function(data){

                    // Clear all options from sub category select
                    $("#selectLeft option").remove();
                    //put in a empty default line
                    var row = "";
                    $(row).appendTo("#selectLeft");
                    // Fill sub category select
                    $.each(data, function(i, j){
                        row = "<option value=\"" + j[1] + "\">" + j[0] + "</option>";
                        $(row).appendTo("#selectLeft");
                    });
                }
            });
        };
    });




    // Ing. Antonio // instituciones - giro de la empresa


    $("#institution_type_id").change(function(){
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            $("#business_line_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("#business_line_id");
            //alert("Failed to submit : Vacio  c");
        }
        else {
            // Send the request and update sub category dropdown
            // window.location = "../get_maps_by_town/" + id_value_string
            $.ajax({
                dataType: "json",
                cache: false,
                url:  application_root_path() + '/institutions_types/for_institution_type_id/' + id_value_string,
                timeout: 20000,
                error: function(XMLHttpRequest, errorTextStatus, error){
                    alert("Failed to submit : " + id_value_string + errorTextStatus+" ;"+error );
                },
                success: function(data){

                    // Clear all options from sub category select
                    $("#business_line_id option").remove();
                    //put in a empty default line
                    var row = "";
                    $(row).appendTo("#business_line_id");
                    // Fill sub category select
                    $.each(data, function(i, j){
                        row = "<option value=\"" + j[1] + "\">" + j[0] + "</option>";
                        $(row).appendTo("#business_line_id");
                    });
                }
            });
        };
    });

    });

    //


  function showMe (it, box) {
    var vis = (box.checked) ? "block" : "none";
    document.getElementById(it).style.display = vis;
    }


   // Mover de Izquierda a Derecha  creado por Ing. Antonio Castellanos

 function moveToRightOrLeft(side){
 var listLeft=document.getElementById('selectLeft');
     var listRight=document.getElementById('selectRight');
      if(side==1){ 
        if(listLeft.options.length==0){
         alert('Usted ya movio todas las líneas de acción a la derecha');
             return false;
         }
        else{
         var selectedAL=listLeft.options.selectedIndex;
              move(listRight,listLeft.options[selectedAL].value,listLeft.options[selectedAL].text); listLeft.remove(selectedAL);
              if(listLeft.options.length>0){
             listLeft.options[0].selected=true;
             } 
        } 
    }
    else if(side==2){
     if(listRight.options.length==0){
         alert('Usted ya movio todas las lineas de acción a la izquierda');
             return false;
         }
        else{
         var selectedAL=listRight.options.selectedIndex;
              move(listLeft,listRight.options[selectedAL].value,listRight.options[selectedAL].text);
             listRight.remove(selectedAL);
              if(listRight.options.length>0){
             listRight.options[0].selected=true;
             } 
        } 
    } 
} 
 function move(listBoxTo,optionValue,optionDisplayText){
 var newOption = document.createElement("option");
     newOption.value = optionValue;
     newOption.text = optionDisplayText;
     listBoxTo.add(newOption, null);
     return true;
 } 

