# Rails 초보 탈출기

#### 1. Rails 프로젝트 생성

```
$ rails new post
$ cd post 
```
#### 2 . Rails 컨트롤러 생성

```
$ rails g(ganerate) controller post index create new
```
- 컨트롤러에 create new에 해당하는 def안에 controller로의 역할을 부여해줌

  - 이를 테면

    ````ruby
     Post.create, Post.find(params[:id])
    ````

#### 3. Rails 모델 생성

```
$ rails g(generate) model post
```

- 모델 생성 후 db의 각 요소들 변경 (username,title,content)

#### 4. Rails db 마이그레이션 

```
$ rails db:migrate
```

- Ex) **db:migrate**, **db:create**, **db:drop**,  **db:setup**,  **db:reset** 

#### 5. Rails Comment 만들기

- model에 comment를 추가한다.

  - db속성도 추가해준다 content등등..

  - <**중요**> model에서 추가할 2가지 [has_many](http://guides.rubyonrails.org/association_basics.html#the-has-many-association)

    - mode -> Post

      ```ruby
      has_many :comments
      ```

      - 중요!!! post는 많은 comment를 가지고 있기때문에 comments다!

    - model -> Comment

      ```ruby
      belongs_to :post
      ```

  - 또한 알아두어야 할것

    ```ruby
    comment.post 하면 접근가능 반대로 post.comment하면 접근가능
    ```


#### 6. Rails 회원가입 및 로그인 로그아웃 등등..

- usercontroller, user db를 만든다 (자세한건 생략)

  - controller에 new create login_process logout등 만들어야겠지?
  - rake db:drop하고 다시 rake db:migrate 해야함

- user model도 만든다.

  - has_many :posts, has_many_comments를 user에 추가한다.
  - 또한 그럼 belongs_to :user 를 이  post와  comment에 추가해야한다.

- session[:user_id]를 이용하여 각각 유효성 검사를 해볼 수 있다. 편리함

  - 너무 친절하게 못가르쳐 줌.. 알아서 언제 쓸지 적용해보길

- login_process를 통해 로그인 검사를 하는데 이것만 알면 다 할 수 있다.

  - User.find_by(email: params[:email])로 db에서 user정보를 가져온다.

  - @user에 그 정보를 담아 3가지의 경우를 물어본다.

    ```ruby
    # 1. db내에 id가 존재하는지 물어봄
    if @user.nil?
    	flash[:alert] = "존재하지 않는 회원입니다. 가입해주세요."
    	redirect_to :back
    else 
    	# 2-1. 아이디가 있고, 비밀번호가 맞으면 로그인
    	if  @user.password == params[:password]
    		flash[:alert] = "로그인 성공"
    		session[:user_id] = @user.id
    		redirect_to :back
    	# 2-2. 아이디는 있지만 비밀번호가 틀리면 반환
    	else
    			flash[:alert] = "패스워드가 틀렸습니다."
    	end
    end
    ```

  - 위 3경우를 잘 생각해보고 이해하면 된다.

  - flash[:alert]는 팝업처럼 띄워주는 기능이다. 나중에 알아보면됨! [flash](http://api.rubyonrails.org/classes/ActionDispatch/Flash.html)

- logout은 별거 없다 session.clear만 해주면 끝!

#### Restful

- POST, GET 이외에 다른 method가 있음

| METHOD | 역할                                       |
| :----: | ---------------------------------------- |
|  POST  | POST를 통해 해당 URI를 요청하면 리소스를 생성합니다.        |
|  GET   | GET를 통해 해당 리소스를 조회합니다. 리소스를 조회하고 해당 도큐먼트에 대한 자세한 정보를 가져온다. |
|  PUT   | PUT를 통해 해당 리소스를 수정합니다.                   |
| DELETE | DELETE를 통해 리소스를 삭제합니다.                   |

