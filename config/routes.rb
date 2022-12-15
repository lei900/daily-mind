Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      post "/auth", to: "authentications#create"
      resources :distortions, only: %i[index show]
      resources :exercises, only: %i[index show] do
        resources :questions, only: %i[index]
        get "/questions/:qid", to: "questions#show"
        get "/questions/:qid/choices", to: "choices#index"
      end
      scope module: :entry do
        resources :diaries, only: %i[create update destroy]
      end
      resources :entries, only: %i[index show create update destroy]
    end
  end

  namespace :admin do
    resources :exercises
    resources :questions
    resources :choices
    resources :distortions
    resources :choice_distortions
    resources :diaries
    resources :entries

    root to: "exercises#index"
  end
end
