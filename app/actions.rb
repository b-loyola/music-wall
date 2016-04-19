helpers do
	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end
end

get '/' do
	@songs = Song.all.order(vote_count: :desc)
  erb :index
end

get '/songs/?' do
	redirect '/'
end

get '/songs/new/?' do
	@song = Song.new
	erb :'songs/new'
end

post '/songs/?' do
	attributes = {title: params[:title], author: params[:author], url: params[:url]}
	if current_user
		@song = current_user.songs.new(attributes)
	else
		@song = Song.new(attributes)
	end
	@song.save ? redirect('/songs') : erb(:'songs/new')
end

get '/songs/:id/?' do
	@song = Song.find(params[:id])
	@youtube_video_code = @song.youtube_embed if @song.url
	@other_songs_from_author = Song.where(author: @song.author).where.not(id: params[:id])
	erb :'songs/show'
end

get '/signup/?' do
	@user = User.new
	erb :signup
end

post '/signup/?' do
	user = User.new(email: params[:email], password: params[:password])
	if user.save
		session[:user_id] = user.id
		redirect '/'
	else
		erb :signup
	end
end

get '/login/?' do
	@user = User.new
	erb :login
end

post '/login/?' do
	user = User.find_by(email: params[:email])

	if user && user.password == params[:password]
		session[:user_id] = user.id
		redirect '/'
	else
		@login_error = "Login Failed."
		@email = params[:email]
		erb :login
	end
end

get '/logout/?' do
	session[:user_id] = nil if current_user
	redirect '/'
end

post '/songs/vote/:id/?' do
	if params[:upvote]
		Vote.create(user_id: current_user.id, song_id: params[:id])
	end
	redirect '/'
end












