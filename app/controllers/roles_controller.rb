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
    @role = Role.find params[:id]

    @users = @role.users.order(created_at: :desc)
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end
end
