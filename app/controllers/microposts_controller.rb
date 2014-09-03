class MicropostsController < ApplicationController
	before_filter :signed_in_user
	def index
	end
	def create
		@micropost = current_user.microposts.build(getparam)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_path
		else
			render 'static_pages/home'
		end
	end
	def destroy
	end
	private
	def getparam
		params.require(:micropost).permit(:content)
	end
end
