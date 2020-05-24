class UsersController < ApplicationController
    before_action :authenticate_user!

	def index
		@users = User.all
		@newbook = Book.new
		@user = current_user

	end
	def show
		@user = User.find(params[:id])
		@newbook = Book.new
		@books = @user.books


	end
	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user)
		end
	end
	def create
		@user = User.new(user_params)
	end
	def update
		@user = User.find(params[:id])
		  if @user.update(user_params)
             redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
          else
          	 render :edit
          end
	end
	private

  def user_params
  	  params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
