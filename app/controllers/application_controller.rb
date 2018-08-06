
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do  #creates a post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do  #loads show page
    @posts= Post.find_by_id(params[:id])
    erb :show
  end

end
