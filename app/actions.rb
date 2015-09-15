####Get Methods####

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
  if session['user_id']
    @current_user = User.find(session['user_id'])
    @tracks = Track.all
    erb :'tracks/index'
  else 
    redirect '/login'
  end
end

get '/users' do 
  @user = User.new
  erb :'users/login'
end

get '/users/registration' do
  @user = User.new
  erb :'users/registration'
end

get '/login' do
  @user = User.new
  erb :'users/login'
end

get '/logout' do
  session['user_id'] = nil
  erb :'index'
end

####Post Methods####

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
  if @user.save
    session['user_id'] = @user.id
    redirect '/tracks'
  else
    erb :'users/registration'
  end
end

post '/login' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
    )
  
  email = @user.email
  fetched_user = User.find_by(email: email)
  if @user.try(:password) == fetched_user.try(:password)
    session['user_id'] = fetched_user.id
    redirect '/tracks'
  else   
    @did_not_match = true
    erb :'users/login'
  end
end
