class SettingsController < ApplicationController
  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save!
      redirect_to edit_setting_path
    else
      render action: "new"
    end
  end

  def update
    @setting = Setting.update(id: params[:id])
    if @setting.update(setting_params)
     redirect_to edit_setting_path
    else
    render action: "edit"
    end
  end


  private
    def setting_params
      params.require(:setting).permit(:inform,:inform_date,:inform_time,:red_date,:green_date).merge(user_id: current_user.id)
    end
end
