class ParentsController < ApplicationController
  before_action :check_logged_in, only: [:index, :show, :destroy, :edit]
  before_action :set_parent, except: [:index, :create, :new]

  def index
    redirect_to logins_login path unless session[:teacher_id]
    @teacher = Teacher.find_by_id(session[:teacher_id])
    @parents = @teacher.parents
    @students = @teacher.students
  end

  def show
  end

  def new
    if session[:teacher_id]
      @parent = Parent.new
    else
      flash[:notice] = "WARNING. YOU ARE NOT A TEACHER. YOU MAY NOT ADD ANY INFORMATION."
      redirect_to logins_login_path
    end
  end

  def create
    if session[:teacher_id]
      @parent = Parent.new(parent_params)

      if @parent.save
        flash[:notice] = "Parent saved successfully."
        redirect_to parents_path
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
    if @parent.update(parent_params)
      redirect_to @parent, notice: 'Parent updated.'
    else
      render :edit
    end
  end

  def show
    redirect_to edit_parent_path(@parent)
  end

  def destroy
    @parent.destroy
    redirect_to parents_path notice: 'Parent deleted.'
  end

  # private def parent_params
  #   # parent = Parent.new
  #   params.require(:parent).permit(:name, :password, :email, :teacher_id, :id)
  #   # parent.teacher_id = session[:id]
  # end

  private

  def check_logged_in
    redirect_to logins_login_path unless session[:teacher_id]
  end

  def set_parent
    @parent = Parent.find(params[:id])
  end

end
