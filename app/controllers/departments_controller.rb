class DepartmentsController < ApplicationController
  def new
    @department = Department.new
  end

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find params[:id]
    @roles = @department.roles
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
