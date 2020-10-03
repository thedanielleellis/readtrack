class BookController < ApplicationController

    get '/books' do
        if logged_in?
            @books = current_user.books
          erb :'/books/index'
        else
          redirect to('/users/login')
        end
      end
    
    #create 
    get '/books/new' do
        if logged_in?
            @current_user
            erb :'/books/new'
        else 
            redirect to('/users/login')
        end
    end 

    post '/books' do
        if logged_in?
        @book = current_user.books.build(params)
        if !@book.save
            @errors = @expense.errors.full_messages
            erb :'/books/new'
        else
            redirect to('/books') 
        end 
        else
            redirect to('/users/login')
        end
    end 

    #read 
    get '/books/:id' do
        @book = Book.find(params[:id])
        if logged_in? && @book.user == current_user
        erb :'/books/show'
        else
            redirect to('/users/login')
        end 
    end

    #update 
    get '/books/:id/edit' do
        @book = Book.find(params[:id])
        if logged_in? && @book.user == current_user
            @book = Book.find(params[:id])
            @user = User.find(session[:user_id])
            erb :'/books/edit' 
        else
            redirect to('/users/login')
        end
    end 

    post '/books/:id' do
        @book = Book.find(params[:id])
        @book.child_name = params[:child_name]
        @book.child_age = params[:child_age] 
        @book.book_title = params[:book_title]
        @book.authors_name = params[:authors_name]
        @book.page_count = params[:page_count]
        @book.reading_level = params[:reading_level]
        if !@book.save
            @errors = @book.errors.full_messages
            erb :'/books/edit'
        else
            redirect to("/books/#{@book.id}")
        end
    end

    #delete 
    post '/books/:id/delete' do 
        @book = Book.find(params[:id])
        if logged_in? && @book.user == current_user
            @book.delete
            redirect to ('/books') 
        else 
            redirect to('/users/login')
        end
    end 
end 