enable 'sessions'

get '/' do
  # Look in app/views/index.erb
  erb :index
end


post '/new_user' do  #new_user
  if params[:password] == params[:confirmation]

    @user = User.create!(name: params[:name], email: params[:email], password: params[:password])
    session[:value] = @user.id
    session[:name] = @user.name
    p session.inspect
    @list_of_decks = Deck.all
    erb :decks

  else

    @error = true
    erb :index

  end
end

post '/decks' do
  u = User.find_by(email: params[:email])

  if params[:password] == u.password

    @list_of_decks = Deck.all
    erb :decks

  else

    erb :index

  end
end

get '/logout' do
  session[:value] = nil
  p session.inspect
  redirect to '/'
end


