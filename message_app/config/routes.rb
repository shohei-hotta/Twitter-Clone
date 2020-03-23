Rails.application.routes.draw do
  root to: "messages#index"
  resources :messages do
    collection do
      post :confirm
    end
  end
end
