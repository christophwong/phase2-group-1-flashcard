get '/deck/:id' do
  @deck = Deck.find(params[:id])
  @cards = @deck.cards.all

  erb :card
end

post '/card/:id' do

  @answer = Card.find(params[:id]).answer
  if @answer.downcase == params[:card][:answer].downcase
    redirect '/'
  else
    redirect '/deck/' + params[:id].to_s
  end
end
