# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#div-sh-2").hide()
  $("#div-sh-3").hide()
  $(".show_hide").click ->
    $(".toHide").hide()
    $("#div-sh-" + $(this).val()).show "slow";

$(document).ready ->
  $("#div-sh-s").hide()
  $(".show_hide_s").click ->
    $(".toHide_s").hide()
    $("#div-sh-s").show "slow";

$(document).ready ->
  $("#div-sh-s").hide()
  $(".show_hide_n").click ->
    $(".toHide_s").hide();

$(document).ready ->
  $("#department_id").change ->
    id_value_string = $(this).val()
    if id_value_string > "0"
      $.ajax
        method: "put"
        dataType: "json"
        cache: false
        url: application_root_path() + "/offices/offices_allocation/for_department_id/" + id_value_string
        timeout: 20000
        error: (XMLHttpRequest, errorTextStatus, error) ->
          alert "Failed to submit : " + errorTextStatus + " ;" + error
        success: (data) ->
          $("#user_id option").remove()
          row = "<option value=\"" + "0" + "\">" + "-- Seleciona un usuario --" + "</option>"
          $(row).appendTo "#user_id"
          $.each data, (i,j) ->
            row = "<option value=\"" + j.user_id + "\">" + j.name + "</option>"
            $(row).appendTo "#user_id";

