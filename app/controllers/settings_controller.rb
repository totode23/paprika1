class SettingsController < ApplicationController
  def index
    @settings = Setting.all
    @users = User.all
  end

  def create
    @setting = Setting.new(setting_params)
    if @fsetting.save
      redirect_to("/setting")
    else
      render action: "index"
    end
  end

  def update
    @setting = Setting.update(id: params[:id])
    if @setting.update(setting_params)
     redirect_to("/setting")
    else
    render action: "index"
    end
  end


  private
    def setting_params
      params.require(:setting).permit(:inform,:inform_date,:inform_time,:red_date,:green_date).merge(user_id: current_user.id)
    end

end
