class Question
  attr_reader :first_num, :second_num
  attr_accessor :first_num, :second_num

  def initialize
    self.first_num = rand(1..20)
    self.second_num = rand(1..20)
  end

  def question
    "What does #{self.first_num} + #{self.second_num} equal?"
  end
  
  def check_answer(answer)
    correct_answer = self.first_num + self.second_num
    correct_answer == answer
  end
  
end
