class DashboardsController < ApplicationController
 def index
     @especialidades= Especialidade.all
  end
end
