class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:nickname, :password)
    User.create(user_params)

    redirect_to '/', notice:'Вы успешно зарегистрировались! '
  end

  def show
    @se = params[:facc]


    #puts("se = " + @se)


  end


end
