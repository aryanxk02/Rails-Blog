class CommentsController < ApplicationController
  # authentication
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])

    # creates and saves the comment
    @comment = @article.comments.create(comment_params)

    # user is sent back to the article
    # helper function calls the show action of ArticlesController
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])

    # @article.comments is a collection of comments
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    byebug
    redirect_to article_path(@article), status: 303
  end

  private
    def comment_params
      # commenter: Name of Commenter
      # body: Comment
      # status: public/private/archived
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
