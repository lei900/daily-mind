Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      post "/auth", to: "authentications#create"
      resources :distortions, only: %i[index show]
      resources :exercises, only: %i[index show] do
        resources :questions, only: %i[index]
        get "/questions/:qid", to: "questions#show"
      end
    end
  end

  namespace :admin do
    resources :exercises
    resources :questions
    resources :choices
    resources :distortions

    root to: "exercises#index"
  end
end
