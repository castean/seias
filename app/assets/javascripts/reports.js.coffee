# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#ISC Christian Alderete slider para cambiar entre  formas
$(document).ready ->
  $("#div-sh-2").hide()
  $("#div-sh-3").hide()
  $(".show_hide").click ->
    $(".toHide").hide()
    $("#div-sh-" + $(this).val()).show "slow"

$(document).ready ->
  $("#div-sh-s").hide()
  $(".show_hide_s").click ->
    $(".toHide_s").hide()
    $("#div-sh-s").show "slow"

$(document).ready ->
  $("#div-sh-s").hide()
  $(".show_hide_n").click ->
    $(".toHide_s").hide()
