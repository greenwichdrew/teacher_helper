class TeachersController < ApplicationController
  # before_action :check_logged_in 

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      flash[:notice] = "Teacher saved successfully."
      redirect_to teachers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end

  private def check_logged_in
    redirect_to logins_login_path unless session[:teacher_id]
  end

end
