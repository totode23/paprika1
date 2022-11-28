class ApplicationController < ActionController::Base
    require 'line/bot'

      def authenticate_user
        if current_user == nil
          redirect_to("/")
        end
      end

end
