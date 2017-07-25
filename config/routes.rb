Rails.application.routes.draw do

  # # custom json controllers
  # get 'ajax/group_labels'
  # get 'ajax/entry_labels'
  #
  # # angularJS json resource controlers
  # resources :entries, :defaults => {format: :json}
  # resources :entry_infos, :defaults => {format: :json}
  # resources :field_infos, :defaults => {format: :json}
  # resources :fields, :defaults => {format: :json}
  # resources :groups, :defaults => {format: :json}
  # resources :projects, :defaults => {format: :json}
  # resources :work_infos, :defaults => {format: :json}
  #
  # # default bootstrap path
  #
  # root to: 'application#index'


  resources :entries
  resources :entry_infos do
    get 'selectable_entries', on: :collection, is_array: true
    get 'selectable_groups', on: :collection, is_array: true
    post 'update_items', on: :collection
  end
  resources :field_infos
  resources :fields
  resources :groups do
    get 'selectable', on: :collection, is_array: true
  end
  resources :projects do
    get 'entries', on: :collection, is_array: true
    get 'selectable_entries', on: :collection, is_array: true
    post 'update_items', on: :collection
  end
  resources :work_infos

  root to: 'projects#index'

  #
  # resources :entries
  # resources :projects
  # resources :work_infos
  # resources :entry_infos
  # # resources :groups_old
  # resources :fields
  # resources :field_infos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
