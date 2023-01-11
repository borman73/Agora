class Web::UsersController < Web::ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      flash[:notice] = 'Account was successfully created. Welcome to Agora!'
      redirect_to(:root)
    else
      render(:new)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'Your account has been successfully updated'
      redirect_to(my_profile_path)
    else
      render(:edit)
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    flash[:notice] = 'Your account has been deleted'
    redirect_to(:sign_in)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :type)
  end
end
