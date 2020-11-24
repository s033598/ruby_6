class CommentsController < ApplicationController
 
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy #metys langa ir prasys prisijungt, jei dar nesi prisijunges
 
  def create
    @article = Article.find(params[:article_id]) #randam straipsni
    @comment = @article.comments.create(comment_params) #straipsniui priskiriam komentara
    redirect_to article_path(@article) #nukreipiam vartotoja i straipsni
  end
 
  def destroy
    @article = Article.find(params[:article_id]) #randam straipsni
    @comment = @article.comments.find(params[:id]) #randam komentara
    @comment.destroy #trinam komentara
    redirect_to article_path(@article) #nukreipiam vartotoja i straipsni
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body) #privalo but komentatoriaus vardas ir pats komentaro turinys
    end
end