class DashboardsController < ApplicationController
load_and_authorize_resource :except => [ :show]
    def index
  end
end
