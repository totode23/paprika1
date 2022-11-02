class FoodsController < ApplicationController
      def index
        if current_user.setting.blank?
          redirect_to new_setting_path
        end
        @foods = Food.where(user: current_user).order(expiry_at: :asc)
      end

      def new
        @food = Food.new
      end
    
      def create
        @food = Food.new(food_params)
        if @food.save
          redirect_to("/foods")
        else
          render action: "index"
        end
      end
    
      def edit
        @food = Food.find_by(id: params[:id])
      end
    
      def update
        @food = Food.find_by(id: params[:id])
        if @food.update(food_params)
         redirect_to("/foods")
        else
        render action: "edit"
        end
      end

      def destroy_all
        checked_data = params[:deletes].keys
        if Food.destroy(checked_data)
          redirect_to ("/foods")
        else
          render action: "index"
        end
      end
    
      def news
    
      end
    
      private
    def food_params
      params.require(:food).permit(:name,:quantity,:expiry_at,:memo,:photo).merge(user_id: current_user.id)
    end
      
end
