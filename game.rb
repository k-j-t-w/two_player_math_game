class Game
  
  attr_reader :player1, :player2, :current_player, :current_question

  def initialize
    @player1 = {id: "Player 1", lives: 3}
    @player2 = {id: "Player 2", lives: 3}
    @current_player = @player1
    @current_question = {}
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def create_question
    num1 = rand(21)
    num2 = rand(21)
    answer = num1 + num2
    @current_question = {question: "#{num1} + #{num2}", answer: answer}
  end

  def start_game
    loop do
      create_question
      puts "#{current_player[:id]}: What is #{current_question[:question]}?"
      print '>'
      user_answer = gets.chomp.to_i

      if user_answer == current_question[:answer]
        puts 'YES! You are correct'
      else
        puts 'Seriously? No!'
        current_player[:lives] -= 1
      end

      if current_player[:lives] <= 0
        puts "#{current_player[:id]} has no more lives!"
        break
      end

      puts "P1: #{player1[:lives]}/3 vs P2: #{player2[:lives]}/3"
      puts '----- NEW TURN -----'
      switch_player
    end
    winner = @player1[:lives] > @player2[:lives] ? @player1 : @player2
    puts "#{winner[:id]} wins with a score of #{winner[:lives]}/3"
    puts "----- GAME OVER -----"
  end

end
