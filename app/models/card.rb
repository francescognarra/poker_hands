class Card < ActiveRecord::Base
  attr_accessible :value, :suit_id, :rank
  belongs_to :suit
end
