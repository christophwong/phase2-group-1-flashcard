get '/deck/:id' do
  deck = Deck.find(params[:id])
  @round =  Round.create(deck_id: deck.id)
  redirect '/round/' + @round.id.to_s
end
