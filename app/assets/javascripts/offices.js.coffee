# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#div-sh").hide()
  $(".show_hide").click ->
    $(".toHide").hide()
    $("#div-sh-" + $(this).val()).show;


$(document).ready ->
  $("select#office_program_id").change ->
    id_value_string = $(this).val()
    if id_value_string > "0"
      $.ajax
        method: "put"
        dataType: "json"
        cache: false
        url:  application_root_path() + "/offices/for_program_id/" + id_value_string
        timeout: 20000
        error: (XMLHttpRequest, errorTextStatus, error) ->
          alert "Failed to submit : " + errorTextStatus + " ;" + error  + id_value_string
        success: (data) ->
          $("#typess").text("Valor")
          #alert "entro"
          # Clear all options from sub category select
          $("#aff_type option").remove()
          #put in a empty default line
          row = "<option value=\"" + "0" + "\">" + "-- Seleciona el Tipo de Actividad --" + "</option>"
          $(row).appendTo "#aff_type"
          # Fill sub category select
          $.each data, (i, j) ->
            row = "<option value=\"" + j[1] + "\">" + j[0] + "</option>"
            $(row).appendTo "#aff_type";