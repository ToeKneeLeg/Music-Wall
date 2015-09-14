# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks/new' do
  @tracks = Track.new
  erb :'tracks/new'
end

get '/tracks/:id' do
  @tracks = Track.find params[:id]
  erb :'tracks/show'
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

post '/tracks' do 
  @tracks = Track.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
    )
  if @tracks.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end