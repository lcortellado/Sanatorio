Rails.application.routes.draw do
 
 
  resources :horarios
get 'send' => 'send#index'
post 'send' => 'send#create'
  resources :admins
  resources :historial_pacientes
  resources :reservas
  resources :pacientes
  resources :dias
  resources :medicos
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
