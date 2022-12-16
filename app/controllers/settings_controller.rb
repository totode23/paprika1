class SettingsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_setting,{only: [:edit]}
  
  def ensure_correct_setting
    if current_user.id != params[:id].to_i
      redirect_to("/")
    end

  end


  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save!
      redirect_to("/foods")
    else
      render action: "new"
    end
  end

  def edit
    @setting = Setting.find_by(id: params[:id])
  end

  def update
    @setting = Setting.find_by(id: params[:id])
    if @setting.update(setting_params)
     redirect_to edit_setting_path
    else
    render action: "edit"
    end
  end


  private
    def setting_params
      params.require(:setting).permit(:inform_date,:red_date,:green_date).merge(user_id: current_user.id)
    end
end
