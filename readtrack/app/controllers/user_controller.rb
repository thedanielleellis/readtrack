class UserController < ApplicationController

    get '/users/signup' do
        if !session[:user_id]
        erb :'/users/create_user'
        else 
            redirect to('/books')
        end
    end 

    post '/users/signup' do
        @user = User.new(params)
        if !@user.save
          @errors = @user.errors.full_messages
          erb :'users/create_user'
        else
          session[:user_id] = @user.id
          redirect to('/books')
        end
      end

    get '/users/login' do
        if !session[:user_id]
          erb :'users/login'
        else
          redirect to('/books')
        end
      end 

    post '/users/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to('/books')
        else 
            @errors = "Invalid username or password."
            erb :'users/login'
        end 
    end 

    get '/users/logout' do
        if logged_in?
            @user = current_user
            @user = nil
            session.destroy
            redirect to('/')
        else
          redirect to('/')
        end
    end

end 