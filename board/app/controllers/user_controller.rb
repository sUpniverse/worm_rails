class UserController < ApplicationController
	def create
		User.create(email: params[:email],
				   username: params[:username],
				   password: params[:password])
		redirect_to '/'	
	end

	def new

	end

	def login_process
		@user = User.find_by(email: params[:email])

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
	end

	def logout
		session.clear
		redirect_to :back
	end

end
