Rails.application.routes.draw do
  resources :articles
  # 주소로 처음 들어가면 HomeController에서 index 액션에 연결해주세요
  root 'home#index'  # get '/' => 'home#index' 라고도 쓸 수 있음
  get '/home' => 'home#hi'
  post 'result' => 'home#result'
  get 'plus/:num1/:num2' => 'home#plus'
  get '/write' => 'home#write'
  post '/create' => 'home#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
