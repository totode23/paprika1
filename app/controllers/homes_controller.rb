class HomesController < ApplicationController
  def index
    @users = User.all
  end


  def invitation
  end
  

  def setting
    @users = User.all
  end


  

end
