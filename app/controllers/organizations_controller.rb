class OrganizationsController < ApplicationController
  def create
    @organization=Organization.create(name: params[:name], description: params[:description], user_id: current_user.id)
    if @organization
      redirect_to "/users/#{current_user.id}"
    else
      flash[:errors]=@organization.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @org=Organization.find(params[:id])
    @user=Organization.find(params[:id]).user.first_name
  end

  def destroy
    @org=Organization.find(params[:id])
    @org.destroy if @org.user_id == current_user.id
    redirect_to "/users/#{current_user.id}"
  end
end
