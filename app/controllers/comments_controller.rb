class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])

    # creates and saves the comment
    @comment = @article.comments.create(comment_params)

    # user is sent back to the article
    # helper function calls the show action of ArticlesController
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
