Rails.application.routes.draw do
  resources :historial_pacientes
  resources :reservas
  resources :horarios
  resources :dias
  resources :pacientes
  resources :medicos
  resources :sexos
  resources :admins
  resources :ciudades
  resources :departamentos
  resources :regiones
  resources :audits
  devise_for :users
  resources :especialidades
  resources :dashboards
    root to: 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
