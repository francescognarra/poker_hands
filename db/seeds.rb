# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Suit.find_or_create_by_name(:name => "C", :description => "clubs")
Suit.find_or_create_by_name(:name => "D", :description => "diamonds")
Suit.find_or_create_by_name(:name => "H", :description => "hearts")
Suit.find_or_create_by_name(:name => "S", :description => "spades")

Suit.all.each do |s|

  Card.find_or_create_by_value_and_suit_id(:value => "A", :suit_id => s.id, :rank => 13)
  Card.find_or_create_by_value_and_suit_id(:value => "K", :suit_id => s.id, :rank => 12)
  Card.find_or_create_by_value_and_suit_id(:value => "Q", :suit_id => s.id, :rank => 11)
  Card.find_or_create_by_value_and_suit_id(:value => "J", :suit_id => s.id, :rank => 10)
  Card.find_or_create_by_value_and_suit_id(:value => "10", :suit_id => s.id, :rank => 9)
  Card.find_or_create_by_value_and_suit_id(:value => "9", :suit_id => s.id, :rank => 8)
  Card.find_or_create_by_value_and_suit_id(:value => "8", :suit_id => s.id, :rank => 7)
  Card.find_or_create_by_value_and_suit_id(:value => "7", :suit_id => s.id, :rank => 6)
  Card.find_or_create_by_value_and_suit_id(:value => "6", :suit_id => s.id, :rank => 5)
  Card.find_or_create_by_value_and_suit_id(:value => "5", :suit_id => s.id, :rank => 4)
  Card.find_or_create_by_value_and_suit_id(:value => "4", :suit_id => s.id, :rank => 3)
  Card.find_or_create_by_value_and_suit_id(:value => "3", :suit_id => s.id, :rank => 2)
  Card.find_or_create_by_value_and_suit_id(:value => "2", :suit_id => s.id, :rank => 1)

end
