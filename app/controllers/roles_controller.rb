class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_role, only: [:show, :edit, :update, :destroy]

  def new
    @role = Role.new
  end

  def index
    @pagy, @roles = pagy(Role.all, items: 10)
  end

  def create
    @role = Role.new role_params
    if @role.save
      redirect_to roles_path, notice: "New role created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @role.update role_params
      redirect_to role_path(@role.id)
    else
      render :edit
    end
  end

  def show
    @users = @role.users.order(created_at: :desc)
  end

  def destroy
    @role.destroy
    redirect_to roles_path
  end

  private

  def find_role
    @role = Role.find params[:id]
  end

  def role_params
    params.require(:role).permit(:name, :department_id)
  end
end
