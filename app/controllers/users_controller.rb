class UsersController < ApplicationController
  def index
  	@user=User.all
  end
  def new
  	@user=User.new
  end
  def show
  	@user=User.find(params[:id])
  end
  def create
  	@user=User.new(getparams)
  	if @user.save
  		sign_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  private
  def getparams
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
