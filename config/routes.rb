Rails.application.routes.draw do
  get 'ajax/group_labels'

  get 'ajax/entry_labels'

  resources :entries
  resources :projects
  resources :work_infos
  resources :entry_infos
  resources :groups
  resources :fields
  resources :field_infos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
