class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(nickname: user_params[:nickname])

    if user.present?
      session[:user_id] = user.id
      redirect_to '/', notice:  'Вы вошли на сайт!'

    else
      flash[:alert] = 'Не правильный email или пароль'
      render :new
    end
  end
end
