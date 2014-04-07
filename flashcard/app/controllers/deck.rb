get '/deck/new' do
  erb :new_deck
end

post '/deck/new' do
  deck = Deck.create(params[:deck])
  @count = params[:card_count]
  erb :new_card
end


get '/deck/:id' do
  Guess.destroy_all
  deck = Deck.find(params[:id])
  @round =  Round.create(deck_id: deck.id)
  redirect '/round/' + @round.id.to_s
end

