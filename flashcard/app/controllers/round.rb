get '/round/:id' do
 @round = Round.find(params[:id])
 @deck = Deck.find(@round.deck_id)
 @cards = @deck.cards
 counter = 1
 while Guess.where(card_id: counter).first != nil do
  counter += 1
 end
  @card = @cards.find(counter)

  erb :card
end
