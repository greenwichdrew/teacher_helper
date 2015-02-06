class GradesController < ApplicationController
  before_action :check_logged_in, only: [:index, :show, :destroy, :edit]
  before_action :set_grade, except: [:index, :create, :new]

  def index
    @teacher = Teacher.find_by_id(session[:teacher_id])
    @students = @teacher.students
  end

  def show
  end

  def new
    if session[:teacher_id]
      @grade = Grade.new
    else
      flash[:notice] = "WARNING. YOU ARE NOT A TEACHER. YOU MAY NOT ADD ANY INFORMATION."
      redirect_to logins_login_path
    end
  end

  def create
    if session[:teacher_id]
      @grade = Grade.new(grade_params)

      if @grade.save
        flash[:notice] = "grade saved successfully."
        redirect_to grades_path
      else
        render :new
      end
    else
      redirect_to logins_login_path
    end
  end

  def edit
  end

  def update
    redirect_to grades_path
  end

  def destroy
  end

  private def grade_params
    # grade = grade.new
    params.require(:grade).permit(:date, :subject, :assignment, :student_id, :id)
    # grade.teacher_id = session[:id]
  end

  private def check_logged_in
    redirect_to logins_login_path unless session[:teacher_id]
  end

  private def set_grade
    @grade = grade.find(params[:id])
  end
end
