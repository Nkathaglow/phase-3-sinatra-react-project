require 'json'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # GET /
  get '/' do
    books = Book.all
    books.to_json
  end
    

  # Routes for booksController
  get '/book' do
    books = Book.all
    books.to_json
  end

  get '/book/:id' do
    book = Book.find(params[:id])
    book.to_json
  end

  post '/book' do
    body = JSON.parse(request.body.read)
    book = Book.create(
      title: body['title'],
      amount: body['amount'],
      description: body['description'],
      image: body['poster']
    )
    book.to_json
  end

  patch '/book/:id' do
    book = Book.find(params[:id])
    book.update(
      title: params[:title],
      amount: params[:amount],
      description: params[:description],
      image: params[:poster]
    )
    book.to_json
  end

  delete '/book/:id' do
    book = Book.find(params[:id])
    book.destroy
    book.to_json
  end
end