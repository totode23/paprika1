class HomesController < ApplicationController
  def index
    @users = User.all
  end

  def top
  end

  def invitation
  end
  
  def food
    @foods = Food.all
  end

  def register
  end

  def create
    @food = Food.new(name: params[:name],quantity: params[:quantity],expiry_at: params[:expiry_at],memo: paramus[:memo])
    @food.save
    redirect_to("/food")
  end

  def news

  end

  def setting
    @users = User.all
  end
end
