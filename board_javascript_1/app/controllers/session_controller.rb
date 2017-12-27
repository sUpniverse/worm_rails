class SessionController < ApplicationController
	def signin
	end


	def user_signin
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			#flash[:notice] 
			redirect_to '/', notice: "로그인 성공"
		else
			#flash[:notice] 
			redirect_to '/signin', notice: "등록되지 않은 아이디거나 패스워드가 틀립니다."			
		end
	end

	def signup
	end

	def user_signup
		User.create(
			email: params[:email],
			password: params[:password],
			password_confirmation: params[:password_confirmation]
			)
		redirect_to '/signin'
	end

	def signout
		session.delete(:user_id)
		redirect_to '/signin', notice: "로그아웃 성공"
	end


end
