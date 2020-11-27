Rails.application.routes.draw do
  root to: 'tasks#index' 
  post '/tasks/:id/toggle', to: 'tasks#toggle'
  resources :tasks
end
