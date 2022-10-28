class ArticlesController < ApplicationController 
    #for template
    def index
        @articles = Article.all
    end

    #for template
    def new 
        @article = Article.new
    end

    def create 
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article #{@article.id} created successfully."
            redirect_to articles_path
            # redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    #for template
    def show
        @article = Article.find(params[:id])
    end

    #for template
    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article #{@article.id} updated successfully."
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end

end