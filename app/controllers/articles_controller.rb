class ArticlesController < ApplicationController 

    before_action :set_article, only: [:show, :edit, :update, :destroy]

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
        @article.user = User.first
        if @article.save
            flash[:success] = "Article #{@article.id} created successfully."
            redirect_to articles_path
            # redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    #for template
    def show
    end

    #for template
    def edit
    end

    def update
        if @article.update(article_params)
            flash[:success] = "Article #{@article.id} updated successfully."
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        params[:id] = nil
        flash[:danger] = "Article #{@article.id} deleted successfully."
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end


    def article_params
        params.require(:article).permit(:title, :description)
    end

end