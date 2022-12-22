class InformsController < ApplicationController
    before_action :authenticate_user
    def index
     @informs = Inform.where(user_id: current_user.id).order(created_at: :DESC)
    end
end
