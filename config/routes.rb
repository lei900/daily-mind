Rails.application.routes.draw do
  namespace :admin do
    resources :exercises

    root to: "exercises#index"
  end
  resources :exercises
end
