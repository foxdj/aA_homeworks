class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts "New Sequence:"
    p @seq.join(" ")
    sleep 2
    system "clear"
  end

  def require_sequence
    puts 'Repeat sequence'
    input = gets.chomp
    @game_over = true if input != @seq.join(" ")
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts 'Great success!'
    puts ""
  end

  def game_over_message
    puts 'Game over! Try again'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

game = Simon.new
game.play