class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_department, only: [:show, :edit, :update, :destroy]

  def new
    @department = Department.new
  end

  def create
    @department = Department.new department_params
    if @department.save
      redirect_to departments_path, notice: "New department created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @department.update department_params
      redirect_to department_path(@department.id)
    else
      render :edit
    end
  end

  def index
    @pagy, @departments = pagy(Department.all, items: 10)
  end

  def show
    @department = Department.find params[:id]
    @roles = @department.roles
  end

  def destroy
    @department.destroy
    redirect_to departments_path
  end

  private

  def find_department
    @department = Department.find params[:id]
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
