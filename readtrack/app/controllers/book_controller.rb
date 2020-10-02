class BookController < ApplicationController

    #create 
    get '/books/new' do
        erb :'/books/new'
    end 

    post '/books' do
        @book = Book.create(
            child_name: params[:child_name], 
            child_age: params[:child_age], 
            book_title: params[:book_title],
            authors_name: params[:authors_name],
            page_count: params[:page_count],
            reading_level: params[:reading_level]
            )
        redirect "/books/#{@book.id}"
    end 

    #read 
    get '/books/:id' do
        @book = Book.find(params[:id])
        erb :'/books/show'
    end

        #show page
    post '/books' do
        @books = Book.all 
        erb :'/books/index'
    end 

    #update 
    get '/books/:id/edit' do
        @book=Book.find(params[:id])
        erb :'/books/edit' 
    end 

    post '/books/:id' do
        @book = Book.find(params[:id])
        @book.update(
            child_name: params[:child_name], 
            child_age: params[:child_age], 
            book_title: params[:book_title],
            authors_name: params[:authors_name],
            page_count: params[:page_count],
            reading_level: params[:reading_level]
            )
        redirect "/books/#{@book.id}"
    end
     

    #delete 
    delete '/books/:id' do 
        @book = Book.find(params[:id])
        @book.destroy
        redirect '/orders' 
    end 
end 