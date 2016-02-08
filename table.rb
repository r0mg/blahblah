class Table

  def print_individual_hand(current_player)
    puts
    puts "#{current_player.type.capitalize} #{current_player.number}'s Hand: #{current_player.hand_total}"
    current_player.hand.each do |card|
          puts "_____________"
          puts "|           |"
          puts "|  #{card}       |"
          puts "|___________|"
        end
  end

end