class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride

    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      start
    end
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def start
    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end
end
