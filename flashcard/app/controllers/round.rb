 get '/round/:id' do
 @round = Round.find(params[:id])
 @deck = Deck.find(@round.deck_id)

 @cards = @deck.cards.all
 card_array = @cards.each_with_object([]){|card, a| a << card}
 @card = card_array
 erb :card
 end
