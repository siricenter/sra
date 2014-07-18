class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@roles = Role.all
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to users_path, notice: "User ##{params[:id]} was successfully removed"
		else
			redirect_to users_path, notice: "User wasn't destroyed"
		end
	end
	
        def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end
        class UsersController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation)
  end

end
