class UsersController < ApplicationController

      #def index
      #end

      def new
      end

    
      def show
        @user = User.find(params[:id])
      end

      def number
      end

      def address
      end

      def credit
      end

      def done
      end
    
      # def update
      #   # if current_user.update(user_params)
      #   #   redirect_to root_path
      #   # else
      #   #   render :edit
      #   # end
      # end

      def identification
      end
      
      # private
    
      # def user_params
      #   params.require(:user).permit(:nickname, :email)
      # end
    end