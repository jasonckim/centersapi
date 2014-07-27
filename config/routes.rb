Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :centers
    end
  end

  resources :centers
  root to: 'centers#index'

end
