class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    email, password = session_params.values
    @user = User.find_by_credentials(email, password)
    if @user.nil?
      redirect_to new_user_url
    else
      log_in_user!(@user)
      redirect_to bands_url
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end
  # private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
