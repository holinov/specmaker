app.controller('EntryInfosCtrl', ($scope, EntryInfo, Group, FieldInfo, action) ->
  ctrl = this
  $scope.entry_infos = []
  ctrl.selected_fields = []

  $scope.save2 = (data, e1) ->
    if(ctrl.entry_info.id == null)
      EntryInfo.create({entry_info: ctrl.entry_info})
    else
      EntryInfo.update({id: ctrl.entry_info.id, entry_info: ctrl.entry_info})
    EntryInfo.update_items({id: ctrl.entry_info.id, fields: ctrl.entry_info.fields, work_infos: ctrl.entry_info.work_infos})

  $scope.new_work = () ->
    work = {
      'name':null,
      'amount':null,
      'units':null,
      'price':0,
    }
    ctrl.entry_info.work_infos.push(work)

  ctrl.add_field = (field) ->
    ctrl.entry_info.fields.push({
      'field_info_id':field.id
      'field_name':field.name,
      'value':0,
      'field_units':field.unit_name
    })

  ctrl.group_change = (item) ->
    if(item)
      ctrl.entry_info.group_id = item.value
    else
      ctrl.entry_info.group_id = null

  ctrl.selectable_items = (text) ->
    selected_ids = ctrl.selected_fields.map((e)->
      e.id
    )
    EntryInfo.selectable_entries({id: ctrl.entry_info.id, query: text, selected: selected_ids}).$promise.then((data) ->
      return data
    )

  action('index', ->
    $scope.entry_infos = EntryInfo.query()
  )

  action('show', (params) ->
    $scope.entry_info = EntryInfo.get({id: params.id})
  )

  action('new', ->
    ctrl.entry_info = EntryInfo.new()
    ctrl.fields = FieldInfo.query()
    $scope.entry_info = ctrl.entry_info
    $scope.save = EntryInfo.create
  );

  action('edit', (params) ->
    ctrl.selectable = Group.selectable();
    ctrl.entry_info = EntryInfo.edit({id: params.id})
    ctrl.fields = EntryInfo.selectable_entries(id: ctrl.entry_info.id)
    $scope.entry_info = ctrl.entry_info
    $scope.save = EntryInfo.update
    ctrl.selectable.$promise.then( (arr) ->
      ctrl.entry_info.$promise.then( (entry) ->
        ctrl.s_group  = arr.find( (x) ->
          x.value == entry.group_id
        )
      )
    )
  )

  action(['index', 'edit', 'show'], ->
    $scope.destroy = (entry_info) ->
      EntryInfo.destroy({id: entry_info.id}, ->
        index = $scope.entry_infos.indexOf(entry_info)
        $scope.entry_infos.splice(index, 1)
      )
  )
)