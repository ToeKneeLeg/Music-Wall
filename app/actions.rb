# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks/new' do
  @tracks = Track.new
  erb :'tracks/new'
end

get '/users' do 
  @user = User.new
  erb :'users/login'
end

get '/users/registration' do
  @user = User.new
  erb :'users/registration'
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

post '/registration' do
  @user = User.new(
    email: params[:email],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:last_name]
    )
  @user.save
  redirect '/tracks'
end

post '/login' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
    )
  
  email = @user.email
  fetched_user = User.where(email: email)
  if @user.password == fetched_user[0].password
    redirect '/tracks'
  else   
    @did_not_match = true
    erb :'users/login'
  end
end
