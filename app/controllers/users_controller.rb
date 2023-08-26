class UsersController < ApplicationController

  before_action :set_current_user
  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :delete, :destroy, :logout]}
  before_action :forbid_login_user, {only: [:login, :new, :create, :login_form]}
  before_action :ensure_correct_user, {only: [:edit, :update, :delete, :destroy]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user  = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice]="ユーザー情報を更新しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], image_name:"default_img.jpg")
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="ユーザーを作成しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def delete
    @user  = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice]="ユーザーを削除しました"
    redirect_to("/")
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/posts/index")
    else
      @error_message ="メールアドレスもしくはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("login_form")
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end

end
