Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      resources :exercises, only: %i[index show]
    end
  end

  namespace :admin do
    resources :exercises
    resources :questions
    resources :choices

    root to: "exercises#index"
  end
end
