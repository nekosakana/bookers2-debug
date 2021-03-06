class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
    	comment = current_user.book_comments.new(book_comment_params)
    	comment.book_id = book.id
    	@book = Book.find(params[:book_id])
    	if comment.save
    		#なにもしない
    	else
	 		@book = Book.find(params[:book_id])
		    @user = User.find(@book.user_id)
		    @newbook = Book.new
	        @book_comment = BookComment.new
	    	render 'books/show'
    	end
	end

	def destroy
		comment = BookComment.find(params[:id])
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.find(params[:id])
		if comment.user != current_user
      		redirect_to request.referer
    	end
		comment.destroy
	end

	private
def book_comment_params
    params.require(:book_comment).permit(:comment)
end
end
