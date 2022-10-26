Rails.application.routes.draw do
  namespace :admin do
    resources :exercises
    resources :questions
    resources :choices

    root to: "exercises#index"
  end
  resources :exercises
end
