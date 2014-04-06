get '/stats/:id' do
  @round_guesses = Guess.where(round_id: params[:id])
  @correct_guesses = @round_guesses.where(correct: true)
  @incorrect_guesses = @round_guesses.where(correct: false)
  erb :stats
end
