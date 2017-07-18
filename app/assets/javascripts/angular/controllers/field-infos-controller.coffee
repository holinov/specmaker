app.controller('FieldInfosCtrl', ($scope, FieldInfo, action) ->
  ctrl = this
  $scope.field_infos = []

  $scope.save2 = (data, e1) ->
    if(ctrl.field_info.id == null)
      FieldInfo.create({field_info: ctrl.field_info})
    else
      FieldInfo.update({id: ctrl.field_info.id, field_info: ctrl.field_info})

  action('index', ->
    $scope.field_infos = FieldInfo.query()
  )

  action('show', (params) ->
    $scope.field_info = FieldInfo.get({id: params.id})
  )

  action('new', ->
    ctrl.field_info = FieldInfo.new()
    $scope.field_info = ctrl.field_info
    $scope.save = FieldInfo.create
  );

  action('edit', (params) ->
    ctrl.field_info = FieldInfo.edit({id: params.id})
    $scope.field_info = ctrl.field_info
    $scope.save = FieldInfo.update
  )

  action(['index', 'edit', 'show'], ->
    $scope.destroy = (field_info) ->
      FieldInfo.destroy({id: field_info.id}, ->
        index = $scope.field_infos.indexOf(field_info)
        $scope.field_infos.splice(index, 1)
      )
  )
)