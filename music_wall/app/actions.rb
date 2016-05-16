# Homepage (Root path)

enable :sessons

get '/' do
  erb :index
end

post '/login' do
  @user = User.where(
    email: params[:email],
    password: params[:password]
    )[0]
  if @user.nil?
    raise "Either your email or your password is incorrect!"
  else
    session[:email] = @user.email
    erb :index
  end
end

get '/logout' do
  session.delete
  # redirect: '/'
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
    )

  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/register' do
  erb :'register/index'
end

post '/register' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    redirect '/'
  else
    erb :'register/index'
  end
end