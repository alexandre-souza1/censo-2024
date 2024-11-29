Rails.application.routes.draw do
  devise_for :users
  # Página inicial definida como "pages#home" (pode ser alterada para "home#index" se necessário)
  root to: "pages#home"

  # Rotas do formulário
  resources :surveys, only: [:new, :create, :show] do
    collection do
      get :export_csv
    end
  end

  resources :questions, only: [] do
    collection do
      get :export_csv
    end
  end

  # Rota para health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Outras rotas podem ser adicionadas aqui
  # root "posts#index" (comentado por padrão)
end
