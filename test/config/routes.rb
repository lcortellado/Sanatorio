Rails.application.routes.draw do
  
 
  resources :delle_pedidos
  resources :pedidos
  resources :sales
  resources :historia_pacientes
  resources :sales do
    resources :sale_details
  end

  resources :proveedores
  resources :reservas
  resources :horarios
  resources :dias
  resources :dia
  resources :horas
  resources :especialidades
  resources :ciudades
  resources :departamentos
  resources :regiones
  resources :barrios
  resources :distritos
  resources :turno_dia
  resources :citas
  resources :projects
  resources :sanatorios
  resources :insumos
  devise_for :usuarios
  root to: 'dashboard#index' 
  resources :formas_pagos
  resources :detalle_internaciones
  resources :internaciones
  resources :habitaciones
  resources :unidades_medidas
  resources :tipos
  resources :consults
  resources :tipo_consults
  resources :medicos
  resources :pacientes
  resources :estados
  resources :tipo_ivas

  #get 'validate_suggested_item/index'
  get '/insumos_suggestion', to: 'innsumos_suggestion#index'
  get '/validate_suggested_insumo', to: 'validate_suggested_insumo#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
