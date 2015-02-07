class StudentsController < ApplicationController
  before_action :check_logged_in, only: [:show, :destroy, :edit]

  def index
    if session[:student_id]
      @student = Student.find_by_id(session[:student_id])
    elsif session[:parent_id]
      @student = Parent.find_by_id(session[:parent_id]).students
    end
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
      redirect_to parents_path
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
    render :edit
  end

  def update
    if @student.update(student_params)
      redirect_to parents_path, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def student_params
    params.require(:student).permit(:name, :email, :teacher_id, :parent_id, :password, :grades, :id)
  end

  def check_logged_in
    redirect_to logins_login_path unless session[:teacher_id]
  end

end
