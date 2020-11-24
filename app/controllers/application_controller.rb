class ApplicationController < ActionController::Base
	def destroy
	  @article = Article.find(params[:id]) #randam straipsni
	  @article.destroy #trinam straipsni
	 
	  redirect_to articles_path #nukreipiam i straipsniu puslapi vartotoja
	end
end
