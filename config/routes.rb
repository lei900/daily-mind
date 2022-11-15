Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      get "/users/new", to: "users#create"
      patch "/users/update", to: "users#update"
      resources :exercises, only: %i[index show] do
        resources :questions, only: %i[index show]
      end
    end
  end

  namespace :admin do
    resources :exercises
    resources :questions
    resources :choices

    root to: "exercises#index"
  end
end
