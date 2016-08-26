class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def show
    #@user = User.find(params[:id])
    @user=User.find(params[:id])
    @organizations=Organization.all
    # @membership=Member.where(user: current_user, organization: @org.id )
    # @creator=Organization.find(params[:id]).user.id
    #@membership=Member.where(user: current_user, organization: @org.id)

  end

  def new
    session[:user_id]=nil
  end

  def create
    @user=User.create user_params
    if (@user.save)
      session[:user_id]=@user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors]=@user.errors.full_messages
      #warn ".........#{flash[:errors]}"
      redirect_to "/users/new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
