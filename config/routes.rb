Rails.application.routes.draw do
  devise_for :users
  # Página inicial definida como "pages#home" (pode ser alterada para "home#index" se necessário)
  root to: "pages#home"
  get '/pages/finish', to: 'pages#finish', as: 'finish'

  # Rotas do formulário
  resources :surveys, only: [:new, :create, :show, :index, :destroy] do
    collection do
      delete :destroy_all
      get :export_csv
      get :export_xlsx
    end
  end

  resources :questions do
    collection do
      get :export_csv
      get :new_import
      post :import
      delete :destroy_all
    end
  end

  # Rota para health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Outras rotas podem ser adicionadas aqui
  # root "posts#index" (comentado por padrão)
end
