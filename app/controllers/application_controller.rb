class ApplicationController < ActionController::Base
  helper_method :current_user #Передаём метод в хелпер для доступа метода во всех шаблонах
  private
  def current_user
    @current_user ||= User.find_by(user_id: session[:user_id]) if session[:user_id]
  end
end
