class WelcomeController < ApplicationController
  def home
  end

  def admin_panel
    @users = User.all
    @departments = Department.all
    @roles = Role.all
  end

  def about
  end
end
