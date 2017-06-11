#class GroupsCtrl
#  constructor: ($scope) ->
#    $scope.index = ->
#      $scope.groups = Group.query();
#
#    $scope.show = (params) ->
#      $scope.grousp = Group.get({id: params.id})

app.controller('GroupsCtrl',['Group', 'action', (Group, action) ->
  ctrl = this

  ctrl.selectedItemChange = (item) ->
    if(item)
      ctrl.group.group_id = item.value
    else
      ctrl.group.group_id = null

  action('index', ->
    ctrl.groups = Group.query()
  )

  action('show', (params) ->
    ctrl.group = Group.get({id: params.id});
  )

  action('new', ->
    ctrl.group = Group.new();
    ctrl.selectable = Group.selectable();
    ctrl.save = Group.create;
  );


  action('edit', (params) ->
    ctrl.group = Group.edit({id: params.id});
    ctrl.selectable = Group.selectable();
    ctrl.selectable.$promise.then( (arr) ->
      ctrl.s_group  = arr.find( (x) ->
        x.value == ctrl.group.group_id
      )
    )
    ctrl.save = Group.update;
  )

  action(['index','edit','show'], ->
    ctrl.destroy = (group) ->
      Group.destroy({id: group.id}, ->
        index = ctrl.groups.indexOf(group);
        ctrl.groups.splice(index,1)
      )
  )
])