class ParentsController < ApplicationController
  # before_action :check_logged_in

  def index
    @parents = Parent.all
  end

  def show
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      flash[:notice] = "Parent saved successfully."
      redirect_to parents_path
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

  private def parent_params
    params.require(:parent).permit(:name, :password, :email, :teacher_id)
  end

  private def check_logged_in
    redirect_to logins_login_path unless session[:teacher_id]
  end

end
