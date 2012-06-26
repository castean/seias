# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# ISC Christian Ivan Alderete Garcia CoffeeScript
$(document).ready ->
  $("#critical_success_factor_objective_satisfying").change ->
    id_value_string = $(this).val()
    if id_value_string > "0"
      $.ajax
        method: "put"
        dataType: "json"
        cache: false
        url: "/critical_success_factors/new/"
        timeout: 2000
        error: (XMLHttpRequest, errorTextStatus, error) ->
          alert "Failed to submit : " + errorTextStatus + " ;" + error
        success: (data) ->
          $("#critical_success_factor_objective_minimum").val(id_value_string - (id_value_string * .05)); 
          $("#critical_success_factor_objective_excelent").val(id_value_string * 1.05);
