class Player
  attr_accessor :type, :hand, :number, :moves

  def initialize(type, number)
    @type = type
    @number = number
    @hand = []
    @moves = 0
  end

  def hand_faces_array
    @hand.map do |card|
      card.chars.first
      end
  end      

  def hand_values_array
    hand_faces_array.map do |face|
      if face == "J" || face == "Q" || face == "K" || face == "1"
        10
        elsif face == "A"
          11 
        else
          face.to_i
        end
      end
  end 

  def hand_total
    hand_values_array.inject(:+)
  end

  def status
    if hand_total == 21
      status = "winner"
    elsif hand_total > 21
      status = "out"
    else
      status = "playing"
    end
  end

end
