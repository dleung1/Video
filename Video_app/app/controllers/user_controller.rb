require 'PasswordHash'

class UserController < ApplicationController
  include PasswordHash
  #protect_from_forgery with: :exception

  def show
  end

  def edit
  end

  def login
  end

  def try_login
	  @user = User.find_by_Name(params[:Name])
	  if @user.present?
		  if PasswordHash.validatePassword(params[:Password], @user.Password)
		  	cookies[:user] = {:value => @user.id.to_s, :expires => Time.now + 3600}
		  	#fix pathing
		  	redirect_to root_path and return
		  else
			  cookies[:error] = "The username or password was incorrect."
		  end
	  else
		cookies[:error] = "The username or password was incorrect."
	  	redirect_to create_path
	  end
  end

  def logout
	  @user = nil
	  cookies[:user] = nil
	  redirect_to(create_path)
  end

  def create
  end

  def V_library
  end
end
