# Rails 초보 탈출기

#### 1. Rails 프로젝트 생성

```
rails new post
cd post 
```
#### 2 . Rails 컨트롤러 생성

```
rails g(ganerate) controller post index create new
```
- 컨트롤러에 create new에 해당하는 def안에 controller로의 역할을 부여해줌

  - 이를 테면

    ````ruby
     Post.create, Post.find(params[:id])
    ````

#### 3. Rails 모델 생성

```
rails g(generate) model post
```

- 모델 생성 후 db의 각 요소들 변경 (username,title,content)

#### 4. Rails db 마이그레이션 

```
rails db:migrate
```

- Ex) **db:migrate**, **db:create**, **db:drop**,  **db:setup**,  **db:reset** 

#### 5. Rails Comment 만들기

- model에 comment를 추가한다.

  - db속성도 추가해준다 content등등..

  - <**중요**> model에서 추가할 2가지

    - mode -> Post

      ```ruby
      has_many :comment
      ```

    - model -> Comment

      ```ruby
      belongs_to :post
      ```

  - 또한 알아두어야 할것

    ```ruby
    comment.post 하면 접근가능 반대로 post.comment하면 접근가능
    ```

    ​

    ​