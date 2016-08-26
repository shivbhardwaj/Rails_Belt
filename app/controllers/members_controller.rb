class MembersController < ApplicationController
  def create
    @member = Member.create(user_id: session[:user_id], organization_id: params[:organization_id])
    if @member.valid?
      redirect_to :back
    else
      flash[:errors]=@member.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
   @member=Member.find(params[:id])
    if @member.user==current_user
      @member.destroy
    end
    redirect_to "/users/#{current_user.id}"
  end
end
