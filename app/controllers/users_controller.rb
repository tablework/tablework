class UsersController < ApplicationController
  def show
    @user = current_user || not_found
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = 'Successfully edited user profile.'
      redirect_to root_path
    else
      flash.now[:error] = "Can't save user profile. Please try again."
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :DOB, :gender, :occupation, :location
    )
  end
end
