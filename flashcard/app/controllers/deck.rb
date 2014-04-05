# get '/deck/:id' do
#   @deck = Deck.find(params[:id])
#    @cards = @deck.cards.all
#    card_array = @cards.each_with_object([]){|card, a| a << card}
#    puts @shuffled_cards = card_array.shuffle
#    @card = @shuffled_cards.pop
#   erb :card
# end

get '/deck/:id' do
  deck = Deck.find(params[:id])
   @round =  Round.create(deck_id: deck.id)

  redirect '/round/' + @round.id.to_s
end