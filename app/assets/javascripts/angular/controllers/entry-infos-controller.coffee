app.controller('EntryInfosCtrl', ($scope, EntryInfo, action) ->
  ctrl = this
  $scope.entry_infos = []

  $scope.save2 = (data, e1) ->
    if(ctrl.entry_info.id == null)
      EntryInfo.create({entry_info: ctrl.entry_info})
    else
      EntryInfo.update({id: ctrl.entry_info.id, entry_info: ctrl.entry_info})

  action('index', ->
    $scope.entry_infos = EntryInfo.query()
  )

  action('show', (params) ->
    $scope.entry_info = EntryInfo.get({id: params.id})
  )

  action('new', ->
    ctrl.entry_info = EntryInfo.new()
    $scope.entry_info = ctrl.entry_info
    $scope.save = EntryInfo.create
  );

  action('edit', (params) ->
    ctrl.entry_info = EntryInfo.edit({id: params.id})
    $scope.entry_info = ctrl.entry_info
    $scope.save = EntryInfo.update
  )

  action(['index', 'edit', 'show'], ->
    $scope.destroy = (entry_info) ->
      EntryInfo.destroy({id: entry_info.id}, ->
        index = $scope.entry_infos.indexOf(entry_info)
        $scope.entry_infos.splice(index, 1)
      )
  )
)