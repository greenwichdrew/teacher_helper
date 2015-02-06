class ParentsController < ApplicationController
  before_action :check_logged_in, only: [:index, :show, :destroy, :edit]

  def index
    @parents = Parent.all
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
  end

  def destroy
  end

  private def parent_params
    params.require(:parent).permit(:name, :password, :email, :teacher_id, :id)
  end

  private def check_logged_in
    redirect_to logins_login_path unless session[:teacher_id]
  end

end
