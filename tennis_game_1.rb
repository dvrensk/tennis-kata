class TennisGame1

  Player = Struct.new(:name, :points)

  def initialize(player1_name, player2_name)
    raise "hell" if player1_name == player2_name
    @player1 = Player.new(player1_name, 0)
    @player2 = Player.new(player2_name, 0)
  end

  def won_point(player_name)
    raise "hell" unless [player1.name, player2.name].include?(player_name)
    if player_name == player1.name
      player1.points += 1
    else
      player2.points += 1
    end
  end

  def score
    if deuce?
      deuce_as_text
    elsif tie_break?
      if points_delta.abs == 1
        "Advantage #{winner_name}"
      else
        "Win for #{winner_name}"
      end
    else
      [
        points_to_text(player1.points),
        points_to_text(player2.points),
      ].join("-")
    end
  end

  def deuce?
    points_delta.zero?
  end

  def points_delta
    player1.points - player2.points
  end

  def winner_name
    if player1.points > player2.points
      player1.name
    elsif player1.points < player2.points
      player2.name
    else
      raise "hell"
    end
  end

  def tie_break?
    player1.points >= 4 || player2.points >= 4
  end

  def deuce_as_text
    if player1.points <= 2
      "#{points_to_text(player1.points)}-All"
    else
      "Deuce"
    end
  end

  POINTS_AS_TEXT = %w[Love Fifteen Thirty Forty]

  def points_to_text(points)
    POINTS_AS_TEXT[points]
  end

  private
  attr_reader :player1, :player2
end
