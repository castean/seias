# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# ISC Christian Ivan Alderete Garcia CoffeeScript
$(document).ready ->
  $("#benefit_benefit_category_id").change ->
    id_value_string = $(this).val()
    if id_value_string > "0"
      $.ajax
        method: "put"
        dataType: "json"
        cache: false
        url: application_root_path() + "/benefits/for_category_id/" + id_value_string
        timeout: 20000
        error: (XMLHttpRequest, errorTextStatus, error) ->
          alert "Failed to submit : " + errorTextStatus + " ;" + error
        success: (data) ->
          $("#benefit_benefit_type_id option").remove()
          row = "<option value=\"" + "0" + "\">" + "-- Seleciona un tipo de apoyo --" + "</option>"
          $(row).appendTo "#benefit_benefit_type_id"
          $.each data, (i,j) ->
            row = "<option value=\"" + j.benefit_category_id + "\">" + j.name + "</option>"
            $(row).appendTo "#benefit_benefit_type_id";
