class TennisGame1

  def initialize(player1_name, player2_name)
    raise "hell" if player1_name == player2_name
    @player1_name = player1_name
    @player2_name = player2_name
    @player1_points = 0
    @player2_points = 0
  end

  def won_point(player_name)
    raise "hell" unless [@player1_name, @player2_name].include?(player_name)
    if player_name == @player1_name
      @player1_points += 1
    else
      @player2_points += 1
    end
  end

  def score
    if deuce?
      deuce_as_text
    elsif tie_break?
      case points_delta.abs
      when 1
        "Advantage #{winner_name}"
      else
        "Win for #{winner_name}"
      end
    else
      [
        points_to_text(@player1_points),
        points_to_text(@player2_points),
      ].join("-")
    end
  end

  def deuce?
    points_delta.zero?
  end

  def points_delta
    @player1_points - @player2_points
  end

  def winner_name
    if @player1_points > @player2_points
      @player1_name
    elsif @player1_points < @player2_points
      @player2_name
    else
      raise "hell"
    end
  end

  def tie_break?
    @player1_points >= 4 || @player2_points >= 4
  end

  def deuce_as_text
    if @player1_points <= 2
      "#{points_to_text(@player1_points)}-All"
    else
      "Deuce"
    end
  end

  POINTS_AS_TEXT = %w[Love Fifteen Thirty Forty]

  def points_to_text(points)
    POINTS_AS_TEXT[points]
  end
end
