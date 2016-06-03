class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    if User.count.zero?
      User.create(name: 'admin', password: 'admin')
    else
      user = User.find_by(name: params[:name])
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to admin_url
      else
        redirect_to login_url, alert: 'Login or Password isn\'t correct!'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: 'You successfully Log Out'
  end
end
