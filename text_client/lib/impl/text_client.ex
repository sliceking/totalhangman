defmodule TextClient.Impl.Player do
  
  @typep game :: Hangman.game
  @typep tally :: Hangman.tally
  @typep state :: {game, tally}


  def start do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({game, tally})
  end

  def interact({_game, _tally = %{state: :won}}) do
    IO.puts("Congrats you won!")
  end
  
  def interact({_game, _tally = %{state: :lost}}) do
    IO.puts("Congrats you lost, loser.")
  end
  
  @spec interact(state) :: :ok
  def interact({game, tally}) do
    IO.puts feedback_for(tally)

    # interact(state)
  end

  def feedback_for(tally = %{state: :initializing}) do
    IO.puts("Welcome, I'm thinking of a #{tally.letters |> length} letter word")
  end

  def feedback_for(%{state: :good_guess}), do: "Good guess"
  def feedback_for(%{state: :bad_guess}), do: "Bad guess"
  def feedback_for(%{state: :already_used}), do: "already used that letter for your guess"
end
