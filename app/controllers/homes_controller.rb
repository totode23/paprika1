class HomesController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @food = Food.find_by(id: params[:id])
  end

  def top
  end

  def invitation
  end
  
  def food
    @foods = Food.all
  end

  def update
    @food = Food.find_by(id: params[:id])
    @food.name = params[:name]
    @food.quantity = params[:quantity]
    @food.expiry_at = params[:expiry_at]
    @food.memo = params[:memo]
    @food.save
    redirect_to("/food")
  end

  def register
    @foods = Food.new
  end

  def create
    @food = Food.new(name: params[:name],quantity: params[:quantity],expiry_at: params[:expiry_at],memo: params[:memo])
    @food.user_id = current_user.id
    @food.save
    redirect_to("/food")
  end

  def news

  end

  def setting
    @users = User.all
  end

  private
def food_params
  params.require(:food).permit(:name,:quantity,:expiry_at ,:memo).merge(user_id: current_user.id)
end
  

end
