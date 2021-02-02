Rails
  .application
  .routes
  .draw do
    # get 'submissions/show'
    # get 'submissions/new'
    root 'submissions#new', as: :index

    # Submissions routing

    constraints Clearance::Constraints::SignedIn.new do
      get 'submissions/export' => 'submissions#export', :as => 'export'
      resources :submissions
    end

    constraints Clearance::Constraints::SignedOut.new do
      get 'submissions/export', to: redirect('/sign_in')
      resources :submissions, only: %i[new create]
      resources :submissions, to: redirect('/sign_in')
    end

    # Clearance routing
    resources :passwords,
              controller: 'clearance/passwords',
              only: %i[create new]

    resource :session, controller: 'clearance/sessions', only: [:create]

    resources :users,
              controller: 'clearance/users',
              only: Clearance.configuration.user_actions do
      resource :password,
               controller: 'clearance/passwords',
               only: %i[edit update]
    end

    get '/sign_in' => 'clearance/sessions#new', :as => 'sign_in'
    delete '/sign_out' => 'clearance/sessions#destroy', :as => 'sign_out'

    if Clearance.configuration.allow_sign_up?
      get '/sign_up' => 'clearance/users#new', :as => 'sign_up'
    end
  end
