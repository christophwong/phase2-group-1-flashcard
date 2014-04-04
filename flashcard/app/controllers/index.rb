get '/' do
  # Look in app/views/index.erb
  @list_of_decks = Deck.all 
  erb :index
end
