# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# ISC Christian Ivan Alderete Garcia CoffeeScript
$(document).ready ->
  $("#tipo").change ->
    id_value_string = $(this).val()
    if id_value_string > "0"
      $.ajax
        method: "put"
        dataType: "json"
        cache: false
        url: application_root_path() + "/activities/for_activitytypeid/" + id_value_string
        timeout: 20000
        error: (XMLHttpRequest, errorTextStatus, error) ->
          alert "Failed to submit : " + errorTextStatus + " ;" + error
        success: (data) ->
          $.each data, (i,j) ->
            $("#typess").text(j.unit_of_measurement.name + "  " + j.measurement_description);

$(document).ready ->
  $(".slidingDiv").hide()
  $(".show_hide").show()
  $(".show_hide").click ->
    $(".slidingDiv").slideToggle();

$(document).ready ->
  $(".slidingDivDepartment").hide()
  $(".show_hide_department").show()
  $(".show_hide_department").click ->
    $(".slidingDivDepartment").slideToggle();

$(document).ready ->
  $("select#activity_program_id").change ->
    id_value_string = $(this).val()
    if id_value_string > "0"
      $.ajax
        method: "put"
        dataType: "json"
        cache: false
        url:  application_root_path() + "/activities/for_programid/" + id_value_string
        timeout: 20000
        error: (XMLHttpRequest, errorTextStatus, error) ->
          alert "Failed to submit : " + errorTextStatus + " ;" + error
        success: (data) ->
          $("#typess").text("Valor")
          #alert "entro"
          # Clear all options from sub category select
          $("#tipo option").remove()
          #put in a empty default line
          row = "<option value=\"" + "0" + "\">" + "-- Seleciona el Tipo de Actividad --" + "</option>"
          $(row).appendTo "#tipo"
          # Fill sub category select
          $.each data, (i, j) ->
            row = "<option value=\"" + j[1] + "\">" + j[0] + "</option>"
            $(row).appendTo "#tipo";