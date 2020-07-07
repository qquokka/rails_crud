# 서버 실행

앱 만들고 컨트롤러 만들기

```bash
$ rails new <프로젝트 이름>
```

```bash
$ rails generate controller <앱 이름>
```



서버 실행시키기

```bash
$ rails s
```



파일 구조

```
// 프로젝트 이름 - crud, 앱 이름 - home
crud
    app
  	  	controllers
  		  		home_controller.rb
  		  views
  			  	home
  				  		index.erb
    config
  	  	routes.rb
```



1. Controller 만들기

   ```ruby
   # crud/app/controllers/home_controller.rb
   class HomeController < ApplicationController
       def index
       end
       
       def hi
           @show_message = true
           @message = "도망쳐"
       end
   end
   ```

2. Routes 수정하기

   ```ruby
   # crud/config/routes.rb
   Rails.application.routes.draw do
     # 주소로 처음 들어가면 HomeController에서 index 액션에 연결해주세요 라는 뜻
     root 'home#index'  # get '/' => 'home#index' 라고도 쓸 수 있음
     get '/home' => 'home#hi'
     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   end
   ```

3. View 만들기

   ```ruby
   # crud/app/views/home/index.erb
   hello world
   ```

   ```ruby
   # crud/app/views/home/hi.erb
   <center style="background: red">hihi</center>
   
   <% if true %>
   <p>하하</p>
   <% end %>
   
   <% if @show_message %>
   <p><%= @message %></p>
   <% end %>
   ```

   `<%= %>` 는 괄호 안의 코드를 실행하고 출력까지 하라는 의미

4. Model 생성하기

   ```bash
   $ rails generate model <모델명>
   or
   $ rails g model <모델명>
   ```

   그러면 `crud/db/migrate`에 마이그레이션 파일 생김

   ```ruby
   # crud/db/migrate/20200706035409_create_posts.rb
   class CreatePosts < ActiveRecord::Migration[6.0]
     def change
       create_table :posts do |t|
   
         t.timestamps
       end
     end
   end
   ```

   

   4.1. `config/migrate` 폴더 안에 있는 `migration` 파일을 수정한다.

   4.2. `rake db:migrate`: 테이블 만들어 줌



## ORM

```ruby
post = Post.find(params[:post_id])
post.destroy
post = Post.new
post.title = params[:title]
post.content = params[:content]
post.save
```



## Scaffolding

```bash
$ rails g scaffold Post content:string title:string
```



## 명령어

```bash
- Rails generate(g)
$ rails generate model account -p
# ("account 라는 모델을 만들어라" 라는 명령어를 치면 뭐가 나오는지 보여줘라.)
# 여기서 -p 또는 --pretend 는 시뮬레이트 해주는 조건이다.

- Destroy(삭제)
$ rails destroy model account -p

- Console(c)(콘솔 화면으로)
$ rails console -e staging
$ rails c
# (-e 또는 --environment 는 다른 레일즈 환경에서 라는 의미이다.)

- Server(s)(서버 관리)
$ rails server [server] [options]
$ rails s
# Server 에는 options 들이 많다.

<server options>
-p : port, 
-b : binding(ip address), 
-c: config file, 
-d: Demonize server, 
-u: Enable debugger, 
-e: Change the environment, 
-P: Specify a PID file

New(새로운 프로젝트 생성)
$ rails new myapp

DB console(DB 콘솔 실행)
$ rails dbconsole

Rake(linux 의 make와 비슷한 build 프로그램)
$ rake --tasks
# rake 명령을 사용하는 명령 목록 보기
$ rake routes
# 현재 공개되어있는 PATH 알아보기

<!-- 여기서 부터는 순서를 생각하고 보자. -->

$ rake db:create
# DB 생성

$ rake db:drop
# DB 제거

$ rake db:migrate
# DB 테이블 변경 적용

$ rake db:rollback
# 이전 버전으로 롤백

$ rake db:seed
# seeds.rb 적용

$ rake db:setup
# db 생성, 테이블 변경 적용, seeds.rb 까지 적용
```

