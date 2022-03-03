class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    goods = Message.all.order(created_at: :asc)
    goods.to_json
  end
  post '/messages' do
    goods = Message.create(
      body: params[:body],
      username: params[:username]
    )
    goods.to_json
  end
  patch '/messages/:id' do
    goods = Message.find(params[:id])
    goods.update(
      body: params[:body]
    )
    goods.to_json
  end
  delete '/messages/:id' do
    goods = Message.find(params[:id])
    goods.destroy
    goods.to_json 
  end
end
