class ArticlesController < ApplicationController
 
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] #metys langa ir prasys prisijungt, jei dar nesi prisijunges
 
  def index
    @articles = Article.all #visi straipsniai
  end
 
  # snippet for brevity
 
  def show
    @article = Article.find(params[:id]) #randam straipsni
  end
 
  def new
    @article = Article.new #naujas straipsni
  end
 
  def edit
    @article = Article.find(params[:id]) #randam straipsni
  end
 
  def create
    @article = Article.new(article_params) #kuriam nauja straipsni
 
    if @article.save
      redirect_to @article #nukreipiam varototoja i straipsni
    else
      render 'new' #nukreipiam varototoja i new forma (straipsnio kurimas)
    end
  end
 
  def update
    @article = Article.find(params[:id]) #randam straipsni
 
    if @article.update(article_params) #randam straipsni
      redirect_to @article #nukreipiam i straipsni
    else
      render 'edit' #nukreipiam varototoja i edit forma, (redagavimas)
    end
  end
 
  def destroy 
    @article = Article.find(params[:id]) #randam straipsni
    @article.destroy #trinam straipsni
 
    redirect_to articles_path #nukreipiam i straipsniu sarasa
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text) #privalo but antraste ir tekstas straipsnio
    end
end