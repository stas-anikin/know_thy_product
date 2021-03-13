class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :outstanding_quizzes

  def new
    @role = Role.new
  end

  def index
    @pagy, @roles = pagy(Role.all, items: 10)
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
