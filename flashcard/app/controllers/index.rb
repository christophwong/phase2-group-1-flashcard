enable 'sessions'

get '/' do
  erb :index
end


post '/new_user' do  #new_user
  if params[:password] == params[:confirmation]
    @user = User.create!(name: params[:name], email: params[:email], password: params[:password])
    session[:value] = @user.id
    session[:name] = @user.name
    @list_of_decks = Deck.all
    erb :decks
  else
    @error = true
    erb :index
  end
end

get '/decks' do
  # raise session.inspect
  if User.where(name: session[:name]).first
    @list_of_decks = Deck.all
    erb :decks
  end
end

post '/decks' do
  u = User.find_by(email: params[:email])
  if params[:password] == u.password
    session[:value] = u.id
    session[:name] = u.name
    @list_of_decks = Deck.all
    erb :decks
  else
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end


