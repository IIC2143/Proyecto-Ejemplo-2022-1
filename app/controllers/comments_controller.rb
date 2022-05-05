class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Profile.new(comment_params)
        if @comment.save
          redirect_to publications_path(@comment.publication)
        else
          render :new
        end
    end

    def delete
      @comment = Comment.find(params[:id])
      @id_publication= @comment.publication
      @comment.destroy
      redirect_to publications_path(@id_publication)
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
