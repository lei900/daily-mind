Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      post "/auth", to: "authentications#create"
      resources :distortions, only: %i[index show]
      resources :exercises, only: %i[index show] do
        resources :questions, only: %i[index]
        get "/questions/:qid", to: "questions#show"
        get "/questions/:qid/choices", to: "choices#index"
        patch "/participations", to: "exercises/participations#update"
      end
      resources :entries, only: %i[index show create update destroy] do
        resources :comments, only: %i[index create update destroy]
      end
      resources :likes, only: %i[create destroy]
      resources :bookmarks, only: %i[create destroy]
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
    resources :communities
    resources :community_entries
    resources :users
    resources :thought_analyses

    root to: "exercises#index"
  end
end
