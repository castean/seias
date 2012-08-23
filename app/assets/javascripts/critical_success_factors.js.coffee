# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# ISC Christian Ivan Alderete Garcia CoffeeScript
$(document).ready ->
  $("#critical_success_factor_objective_satisfying").change ->
    id_value_string = $(this).val()
    valores = window.location.pathname + "/"
    if id_value_string > "0"
      $.ajax
        method: "put"
        dataType: "json"
        cache: false
        timeout: 2000
        error: (XMLHttpRequest, errorTextStatus, error) ->
          alert valores
          alert   "Failed to submit : " + errorTextStatus + " ;" + error
        success: (data) ->
          $("#critical_success_factor_objective_minimum").val(id_value_string - (id_value_string * .05)); 
          $("#critical_success_factor_objective_excelent").val(id_value_string * 1.05);



# Ing. Antonio Castellanos // Programas y Lineas de Acción
$("#program_id").change ->
  id_value_string = $(this).val()
  if id_value_string is ""

    # if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
    $("#selectLeft option").remove()
    row = "<option value=\"" + "" + "\">" + "" + "</option>"
    $(row).appendTo "#selectLeft"
    alert "Failed to submit : Vacio  c"
  else

    # Send the request and update sub category dropdown
    # window.location = "../get_maps_by_town/" + id_value_string
    alert "Failed to submit : entro  c"
    $.ajax
      dataType: "json"
      cache: false
      url: application_root_path() + "/critical_success_factors/for_program_id/" + id_value_string
      timeout: 20000
      error: (XMLHttpRequest, errorTextStatus, error) ->
        alert valores
        alert "Failed to submit : " + errorTextStatus + " ;" + error

      success: (data) ->

        # Clear all options from sub category select
        $("#selectLeft option").remove()

        # Fill sub category select
        $.each data, (i, j) ->
          row = "<option value=\"" + j.id + "\">" + j.name + "</option>"
          $(row).appendTo "#selectLeft"