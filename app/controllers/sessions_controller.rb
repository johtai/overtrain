class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(user_id: user_params[:user_id])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to '/', notice:  'Вы вошли на сайт!'

    else
      flash[:alert] = 'Не правильный email или пароль'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/', notice: 'Вы вышли из аккаунта'
  end


end
