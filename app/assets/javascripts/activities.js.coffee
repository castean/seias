# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# ISC Christian Ivan Alderete Garcia CoffeeScript
$(document).ready ->
  $("select#activity_activity_type_id").change ->
    id_value_string = $(this).val()
    if id_value_string > "0"
      $.ajax
        method: "put"
        dataType: "json"
        cache: false
        url: "/activities/for_activitytypeid/" + id_value_string
        timeout: 2000
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