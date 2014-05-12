class HomeController < ApplicationController
  
  def index
    
  end
  
  def single_poker_hand
    
    @hand = Card.order("RAND()").first(5)
    @result = get_rank(@hand)
    
    
  end
  
  def two_poker_hands
    
    @hands = Card.order("RAND()").first(10)

    @hand1 = @hands[0..4]
    @hand2 = @hands[5..9]
    @result1 = get_rank(@hand1)
    @result2 = get_rank(@hand2)
    
    @win = @result1.first < @result2.first ? "Player 2 win!!!"  : @result1.first > @result2.first ? "Player 1 win!!!" : "Nobody Win..."
    
  end
end

private 

def get_rank(hand)
  unless poker?(hand).nil?
    c = poker?(hand)
    s = "poker of " + c.first.value
    result = [5, s]
  else
      unless three_of_a_kind?(hand).nil?
        c = three_of_a_kind?(hand)
        s = "three of " + c.first.value
        result = [3, s]
      else
        unless pair?(hand).nil?
          c = pair?(hand)
          s = "a pair of " + c.first.value 
          result = [2, s]
        else
          c = high_card?(hand)
          s = "High card " + c.value + " of " + c.suit.description
          result = [1, s]
        end
      end 
  end
    
  return result
end


def pair?(hand)
  value = nil
  combinations = hand.combination(2)
  combinations.each do |c|
    if c[0].rank == c[1].rank
      value = c
      return value
    end
  end
  return value
end

def three_of_a_kind?(hand)
  value = nil
  combinations = hand.combination(3)
  combinations.each do |c|
    if c[0].rank == c[1].rank && c[1].rank == c[2].rank
      value = c
      return value
    end
  end
  return value
end

def poker?(hand)
  value = nil
  combinations = hand.combination(4)
  combinations.each do |c|
    if c[0].rank == c[1].rank && c[1].rank == c[2].rank && c[2].rank == c[3].rank
      value = c
      return value
    end
  end
  return value
end

def high_card?(hand)
  
  max_rank = hand.collect{|h| h.rank}.sort.last
  
  hand.each do |c|
    if c.rank == max_rank
      return c
    end
  end
  
end
