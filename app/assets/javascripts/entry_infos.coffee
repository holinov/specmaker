# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  group = $(".group_selector")
  selector = group.find('input.selector')
  selected = group.find('input.selected')
  group.find('input.selector').autocomplete
    source: (request, response) ->
      $.ajax({
        url: "/ajax/group_labels.json",
        dataType: "json"
        success: (data) ->
          console.log(data);
          response(data);

        error: (error) ->
          console.log(error);
          response([{label: "Choice1", value: "value1"}])
      })

    select: (event, ui)  ->
      group.find(selector).val(ui.item.label);
      group.find(selected).val(ui.item.value);
      return false;

  selector.focus (event, ui) ->
    $(group.find('input.selector')).autocomplete("search")

