require './Player'
require './Question'

class Game
  attr_reader :player1, :player2, :round
  attr_writer :player1, :player2, :round
  attr_accessor :player1, :player2, :round

  def initialize(player1, player2)
    self.player1 = Player.new(player1)
    self.player2 = Player.new(player2)
    self.round = 1
  end

  def start
    current_player = self.player1

    while (self.player1.lives > 0 && self.player2.lives > 0)
      question = Question.new
      puts "#{current_player.name} #{question.question}?"
      print "> "
      answer = $stdin.gets.chomp
      correct = question.check_answer(answer)
      if !correct
        current_player.lives = current_player.lives - 1 
      end
      puts "#{self.player1.name}: #{self.player1.lives}/3 vs #{self.player2.name}: #{self.player2.lives}/3"
      puts "----------- NEW TURN -----------"
      current_player = current_player == self.player1 ? self.player2 : self.player1
    end

    puts "#{current_player.name} wins with a score of #{current_player.lives}/3"
    puts "----------- GAME OVER -----------"
    puts "Good bye!"
  end
  
end

g = Game.new("Player1", "Player2")
g.start