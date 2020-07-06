class HomeController < ApplicationController
    def index
    end
    
    def hi
        @show_message = true
        @message = "도망쳐"
    end

    def result
        @plus_result = params[:num1].to_i + params[:num2].to_i
    end
end
