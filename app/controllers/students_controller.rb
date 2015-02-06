class StudentsController < ApplicationController
  before_action :check_logged_in, only: [:index, :show, :destroy, :edit]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = "Student saved successfully."
      redirect_to students_path
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

  private def student_params
    params.require(:student).permit(:name, :email, :teacher_id, :parent_id, :password, :grades, :id)
  end

  private def check_logged_in
    redirect_to logins_login_path unless session[:student_id]
  end

end
