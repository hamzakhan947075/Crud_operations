class ArticlesController < ApplicationController
    before_action :set_article,only: [:edit,:show,:destroy,:update]
    def index
        @articles=Article.paginate(page: params[:page], per_page:5)
    end
  def new
     @article=Article.new
  end

    def create
        # debugger
   @article = Article.new(article_params)
   @article.user= User.first
   # @article.save
# redirect_to article_path(@article)
        if @article.save
        flash[:success]="Article was sucessfully created "
        redirect_to article_path(@article)

        else
        render 'new'
        end
    end

def show
    @articles=Article.all
end

def destroy
    @article.destroy
    flash[:danger]="Articles was Deleted Successfully"
    redirect_to articles_path
end

def edit
    
end 

def update
    if @article.update(article_params)
        flash[:success]="Article was updated Succesfully"
        redirect_to article_path(@article)
    else
        render 'edit'
    end
end
    private
    
    def article_params
    
    params.require(:article).permit(:title, :description)
    
    end
    def set_article
        @article=Article.find(params[:id])
    end
end