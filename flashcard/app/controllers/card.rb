post '/card/:id' do
  @answer = Card.find(params[:id])
  if @answer.answer.downcase == params[:card][:answer].downcase
    redirect '/'
  else
    redirect '/round/' + Round.last.id.to_s
  end
end
