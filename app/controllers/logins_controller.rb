class LoginsController < ApplicationController
  def login
  end

  def teacher_login
    if request.post?
      teacher = Teacher.find_by_email(params[:email])
      if teacher && teacher.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        flash[:notice] = "Welcome!"
        redirect_to parents_path
      else
        flash.now[:notice] = "INTRUDER. DESTROY. DESTROY."
      end
    end
  end

  def parent_login
    if request.post?
      parent = Parent.find_by_email(params[:email])
      if parent && parent.authenticate(params[:password])
        session[:parent_id] = parent.id
        flash[:notice] = "Welcome!"
        redirect_to parents_path
      else
        flash.now[:notice] = "INTRUDER. DESTROY. DESTROY."
      end
    end
  end

  def student_login
    if request.post?
      student = Student.find_by_email(params[:email])
      if student && parent.authenticate(params[:password])
        session[:student_id] = student.id
        flash[:notice] = "Welcome!"
        redirect_to parents_path
      else
        flash.now[:notice] = "INTRUDER. DESTROY. DESTROY."
      end
    end
  end

  def logout
    if session[:teacher_id]
      session[:teacher_id] = nil
    elsif session[:parent_id]
      session[:parent_id] = nil
    elsif session[:student_id]
      session[:student_id] = nil
    end
      redirect_to logins_login_path
  end
end
