class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications
  has_many :captains, through: :boats


  def self.my_all
    self.all
  end

  def self.longest
    result = Boat.all.order(length: :desc).limit(1)
      self.joins(:boats).where("boats.id" => result.ids)
  end






end
