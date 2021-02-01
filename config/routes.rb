Rails
  .application
  .routes
  .draw do
    # get 'submissions/show'
    # get 'submissions/new'
    root 'static_pages#index'

    resources :submissions
  end
