class Game

  def initialize(card_deck)
    @deck = card_deck.shuffle
    @dealer = Player.new("dealer", nil)
    @all_players = all_players 
    @table = Table.new
   # @current_player = @all_players.first
  end

  def all_players
    player_array = []
      for x in 1..get_number_of_players
        player_array << Player.new("player", x)
      end
    player_array << @dealer
  end

  def game_play_loop
    deal_first_round
    show_player_status

      while true
        @all_players.each do |player| #iterates through all players and dealer
          @current_player = player
          player_out(player) # checks if player hand is over 21
          player_win(player) # checks if player hand = 21
          hitting_loop(player) # for players that didn't win and didn't score over 21
                              # prompts user to choose 'hit' or 'stay'
                              # player_out and game_over are called after a new card is added


          if player_win(player)
            puts "#{player.type.capitalize} #{player.number} wins!"
            puts "Game is over, go home"
            break
          end
    
      end
    end
  end

  def deal_first_round
    @all_players.each do |player|
      @current_player = player
      2.times do player_hit
        end
      show_player_hand
      end 
  end

  def hitting_loop(player)

    if player.type == "dealer" #this makes the dealer's hand go automatically! need to quit loop after
      player_hit
      show_player_hand
      player_out(player)
      player_win(player)
    else

    while player.status == "playing"
        move = get_player_move(player) 
        if hit?(move) 
          player_hit
          show_player_hand
          player_out(player)
          player_win(player)
        else
          break 
        end
      end
    end
    end

  def player_out(player)
    if player.status == "out"
      puts "#{player.type.capitalize} #{player.number} is out :'("
    end
  end


  def get_player_move(player)
    puts "#{player.type.capitalize} #{player.number}, your hand is currently at #{player.hand_total}. Enter '1' to hit or '0' to stay."
    player_move = gets.chomp
  end

  def hit?(move)
    if move == "1"
      true
    end
  end

  def player_hit
    @current_player.hand << @deck.pop
  end

  def show_player_hand
    @table.print_individual_hand(@current_player)
  end

  def get_number_of_players
    puts "How many ppl want to play???"
    number = gets.chomp.to_i
  end

  def show_player_status
    @all_players.each do |player|
      puts "#{player.type.capitalize} #{player.number} status: #{player.status}"
    end
  end

  def player_win(player)
    if player.status == "winner"
      true
    end
  end


end