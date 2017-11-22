class AuditsController < ApplicationController
  before_action :set_especialidade, only: [:show, :edit, :update, :destroy]

def index
   @audits= Audit.all 
    @users= User.all 
end

end
