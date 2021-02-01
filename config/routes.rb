Rails
  .application
  .routes
  .draw do
    # get 'submissions/show'
    # get 'submissions/new'
    root 'static_pages#index'

    get '/thanks' => 'static_pages#thanks', :as => :thanks

    # Submissions routing

    resources :submissions, only: %i[new create]

    constraints Clearance::Constraints::SignedIn.new do
      resources :submissions
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

    get '/admin', to: redirect('/sign_in')

    get '/sign_in' => 'clearance/sessions#new', :as => 'sign_in'
    delete '/sign_out' => 'clearance/sessions#destroy', :as => 'sign_out'

    if Clearance.configuration.allow_sign_up?
      get '/sign_up' => 'clearance/users#new', :as => 'sign_up'
    end
  end
