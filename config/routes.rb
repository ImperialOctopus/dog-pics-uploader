Rails.application.routes.draw do
  get 'submit/form'
  get 'submit/result'
  root 'application#hello'
end
