# Game Class
  # Initialize with player 1, player 2
  # Initialize a way to keep track of whose turn it is
  # Create method to reduce number of lives

# Initialize player's class with name and set lives to 3

# Question Class
  # initialize with whose turn it is
  # generate question

# Continue to play game while player's lives are greater than 0

  # Create random math questions with numbers from 1 to 20

  # Get player input

  # Method to check answer with player input and adjust lives accordingly


class Player
  attr_reader :name, :lives
  attr_writer :name, :lives

  def initialize(name)
    self.name = name
    self.lives = 3
  end

end

class Question
  attr_reader :name, :first_num, :second_num
  attr_writer :name, :first_num, :second_num
  attr_accessor :name, :first_num, :second_num

  def initialize(name)
    self.name = name
    self.first_num = rand(1..20)
    self.second_num = rand(1..20)
  end

  def question
    puts "#{self.name}: What does #{self.first_num} + #{self.second_num} equal?"
    print "> "
    answer = $stdin.gets.chomp
    answer_int = answer.to_i
    correct_answer = self.first_num + self.second_num
    correct_answer == answer_int
  end
end

class Game
  attr_reader :player1, :player2, :round
  attr_writer :player1, :player2, :round
  attr_accessor :player1, :player2, :round

  def initialize(player1, player2)
    self.player1 = Player.new(player1)
    self.player2 = Player.new(player2)
    self.round = 1
  end

  def reduce(player)
    player.lives = player.lives - 1
  end

  def winner(player1, player2)
    if player1.lives == 0
      return player2
    else
      return player1
    end
  end

  def start
    while (self.player1.lives > 0 && self.player2.lives > 0)
      if self.round % 2 == 1
        question = Question.new(self.player1.name).question
        if !question
          reduce(self.player1)
          puts "#{self.player1.name}: Seriously? No!"
        else
          puts "#{self.player1.name}: YES! You are correct."
        end
      else 
        question = Question.new(self.player2.name).question
        if !question
          reduce(self.player2)
          puts "#{self.player2.name}: Seriously? No!"
        else
          puts "#{self.player2.name}: YES! You are correct."
        end
      end
      self.round = self.round + 1
      puts "#{self.player1.name}: #{self.player1.lives}/3 vs #{self.player2.name}: #{self.player2.lives}/3"
      puts "------------- NEW TURN -------------"
    end
    winner = winner(self.player1, self.player2)
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "------------- GAME OVER -------------"
    puts "Good bye!"
  end
  
end

g = Game.new("Player1", "Player2")
g.start