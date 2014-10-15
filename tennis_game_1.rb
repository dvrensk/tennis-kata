class TennisGame1

  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1points = 0
    @p2points = 0
  end

  def won_point(player_name)
    if player_name == @player1_name
      @p1points += 1
    else
      @p2points += 1
    end
  end

  def score
    result = ""
    tempScore=0
    if (@p1points==@p2points)
      result = {
          0 => "Love-All",
          1 => "Fifteen-All",
          2 => "Thirty-All",
      }.fetch(@p1points, "Deuce")
    elsif (@p1points>=4 or @p2points>=4)
      minusResult = @p1points-@p2points
      if (minusResult==1)
        result ="Advantage " + @player1_name
      elsif (minusResult ==-1)
        result ="Advantage " + @player2_name
      elsif (minusResult>=2)
        result = "Win for " + @player1_name
      else
        result ="Win for " + @player2_name
      end
    else
      (1...3).each do |i|
        if (i==1)
          tempScore = @p1points
        else
          result+="-"
          tempScore = @p2points
        end
        result += {
            0 => "Love",
            1 => "Fifteen",
            2 => "Thirty",
            3 => "Forty",
        }[tempScore]
      end
    end
    result
  end
end
