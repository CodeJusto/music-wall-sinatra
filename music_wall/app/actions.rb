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
  session.clear
  redirect :'/'
end

get '/songs' do
  @songs = Song.all.sort {|a,b| b.votes.count <=> a.votes.count }
  erb :'songs/index'
end


get '/songs/new' do
  if session[:email].nil?
    redirect '/register'
  else
    erb :'songs/new'
  end
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url],
    posted_by: session[:email]
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

post '/upvote' do
  @song_id = params[:song_id]
  session[:id] = User.find_by(email:session[:email]).id
  @upvote = Vote.new(user_id: session[:id], song_id: @song_id.to_i)
  @upvote.save
  @songs = Song.all
  erb :'songs/index'
end


