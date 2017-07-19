app.controller('ProjectsCtrl', ['Project', 'Entry', 'action', (Project, Entry, action) ->
  ctrl = this
  ctrl.entries = []


  ctrl.add_entry = (item,event) ->
    if item
      if ctrl.entries.$promise
        ctrl.entries.$promise.then((arr) ->
          item.amount = 1
          ctrl.entries.push(item)
        )
      else
        item.amount = 1
        ctrl.entries.push(item)

  ctrl.remove_entry = (item, event) ->
    idx = ctrl.entries.indexOf(item)
    if(idx > -1)
      ctrl.entries.splice(idx, 1)
    ctrl.selectable = Project.selectable_entries({id: ctrl.project.id})

  ctrl.selectable_items = (text) ->
    selected_ids = ctrl.entries.map((e)->
      e.id
    )
    Project.selectable_entries({id: ctrl.project.id, query: text, selected: selected_ids}).$promise.then((data) ->
      console.log(data)
      return data
    )

  ctrl.save2 = (data, e1) ->
    if(ctrl.project.id == null)
      Project.create({project: ctrl.project})
    else
      Project.update({id: ctrl.project.id, project: ctrl.project})
    Project.update_items({items: ctrl.entries, id: ctrl.project.id})

  action('index', ->
    ctrl.projects = Project.query()
  )

  action('show', (params) ->
    ctrl.project = Project.get({id: params.id})
    ctrl.entries = Project.entries({id: params.id})
  )

  action('new', ->
    ctrl.project = Project.new()
    ctrl.selectable = Project.selectable_entries()
    ctrl.save = Project.create
  );


  action('edit', (params) ->
    ctrl.project = Project.edit({id: params.id})
    ctrl.entries = Project.entries({id: params.id})
    ctrl.selectable = Project.selectable_entries({id: params.id})
    ctrl.save = Project.update
  )

  action(['index', 'edit', 'show'], ->
    ctrl.destroy = (project) ->
      Project.destroy({id: project.id}, ->
        index = ctrl.projects.indexOf(project)
        ctrl.projects.splice(index, 1)
      )
  )
])