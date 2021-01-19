Rails.application.routes.draw do
  # get 'submissions/show'
  # get 'submissions/new'
  root 'application#hello'

  resources :submissions
end
