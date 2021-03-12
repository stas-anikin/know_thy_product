class RolesController < ApplicationController
  before_action :authenticate_user!

  def new
    @role = Role.new
  end

  def index
    @roles = Role.all
  end

  def show
    @departments = @role.departments.order(roles_count: :desc)
    @users = @role.users.order(roles_count: :desc)
    @role = role.find params[:id]
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end
end
