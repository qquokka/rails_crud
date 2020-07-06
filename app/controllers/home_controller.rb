class HomeController < ApplicationController
    def index
        @posts = Post.all
    end
    
    def hi
        @show_message = true
        @message = "도망쳐"
    end

    def result
        @plus_result = params[:num1].to_i + params[:num2].to_i
    end

    def plus
        @plus_result = params[:num1].to_i + params[:num2].to_i
    end

    def write
    end

    def create
        post = Post.new
        post.title = params[:title]
        post.content = params[:content]
        post.save

        redirect_to '/index'
    end
end
