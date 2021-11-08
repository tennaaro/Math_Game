
class Player
  attr_reader :name, :lives
  attr_writer :name, :lives

  def initialize(name)
    self.name = name
    self.lives = 3
  end

end