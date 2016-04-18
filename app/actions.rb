# Homepage (Root path)
get '/' do
	@songs = Song.all
  erb :index
end

get '/songs' do
	redirect '/'
end

get '/songs/new' do
	erb :'songs/new'
end

post '/songs' do
	@song = Song.new(title: params[:title], author: params[:author], url: params[:url])
	@song.save ? redirect('/songs') : erb(:'songs/new')
end

get '/songs/:id' do
	@song = Song.find(params[:id])
	erb :'songs/show'
end
