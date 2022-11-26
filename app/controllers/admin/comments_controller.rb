class Admin::CommentsController < ApplicationController

 def index
		@comment = Comment.new
		@sauna = Sauna.find(params[:sauna_id])
		@comments = @sauna.comments.all
 end

  def destroy
  	Comment.find(params[:id]).destroy
  	redirect_to admin_saunas_path(params[:sauna_id])
  	flash[:notice] = "コメントを削除できました"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
