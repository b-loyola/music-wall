# Homepage (Root path)
get '/' do
	@songs = Song.all
  erb :index
end

get '/songs/new' do
	erb :'songs/new'
end
