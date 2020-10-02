class UserController < ApplicationController

    get '/users/signup' do
        erb :'/users/signup'
    end 

    post '/users/signup' do
        if params[:username]== " " && params[:password]== " "
            redirect "/users/signup"
        else 
            @user = User.create(
                username: params[:username], 
                password: params[:password]
                )
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        end 
    end

    #show page 
    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    get '/users/login' do
        #if the user is loggined redirect to their homepage 
        if logged_in?
            @user = User.find(session[:user_id])
            redirect "/users/#{@user.id}"
        #else, show them the log in form 
        else 
            erb :'/users/login'
        end
    end 

    post '/users/login' do 
        #want to find the user, if it exists
        @user = User.find_by(username: params[:username])
        #if user exist, authenticate password
        if @user && @user.authenticate(params[:password])
            session[:user_id]=@user.id 
            redirect "/users/#{@user.id}"
        else 
            redirect "/users/login"
        end 
    end 



end 