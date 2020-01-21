
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end
  #render new form to create articles
  get '/articles/new' do 
      
    erb :new
  end
  #post route would recieve params in hash information user enter and process
   post "/articles" do

    article = Article.create(:title => params[:title], :content => params[:content])
    redirect "/articles/#{article.id}"
    end
   
   get "/articles/:id" do 
     @articule = Article.find_by(id: params[:id])
     
      erb :show
    end
    
    get "/articles" do 
        @articles = Article.all
        
      erb :index
    end
    

    get '/articles/:id/edit' do  #load edit form
    @article = Article.find_by_id(params[:id])
    erb :edit
    end
    
    patch '/articles/:id' do #edit action
      @article = Article.find_by_id(params[:id])
      @article.title = params[:title]
      @article.content = params[:content]
      @article.save
      redirect to "/articles/#{@article.id}"
    end
      delete '/articles/:id' do #delete action
         @article = Article.find_by_id(params[:id])
         @article.delete
         redirect '/articles'
      end

  end
    
  
    
    
    
    

