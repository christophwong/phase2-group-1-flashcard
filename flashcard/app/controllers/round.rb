get '/round/:id' do
 @round = Round.find(params[:id])
 @deck = Deck.find(@round.deck_id)
 @cards = @deck.cards
 counter = @cards.first.id
 while Guess.where(card_id: counter).first != nil do
  counter += 1
 end
  if counter > @cards.last.id
    @list_of_decks = Deck.all
    Guess.destroy_all
    erb :decks
  else
    @card = @cards.find(counter)
    erb :card
  end
end
