class SearchController < ApplicationController
	def search
		@user_or_post = params[:option]
		@how_search = params[:choice]
		if @user_or_post == "1"
			@users = User.search(params[:search], @user_or_post, @how_search)
		else
			@books = Book.search(params[:search], @user_or_post, @how_search)
		end
	end
end
