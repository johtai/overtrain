class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(user_id: user_params[:user_id])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.user_id
      redirect_to '/', notice:  'You have signed in!'

    else
      flash[:alert] = 'Incorrect username or password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/', notice: 'You have signed out'
  end


end
