post '/card/:id' do
  @answer = Card.find(params[:id])
  if @answer.answer.downcase == params[:card][:answer].downcase
    Guess.create(card_id: params[:id], correct: true, round_id: Round.last.id)
    redirect '/round/' + Round.last.id.to_s
  else
    Guess.create(card_id: params[:id], correct: false, round_id: Round.last.id)
    redirect '/round/' + Round.last.id.to_s
  end
end
