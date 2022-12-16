class InformsController < ApplicationController
    before_action :authenticate_user
    def index
     @informs = Inform.where(user: current_user).order(created_at: :DESC)
    end
end
