class HomeController < ApplicationController
    def index
    end
    
    def hi
        @show_message = true
        @message = "도망쳐"
    end
end
