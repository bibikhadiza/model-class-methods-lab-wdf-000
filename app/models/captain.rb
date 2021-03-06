class Captain < ActiveRecord::Base
  has_many :boats
  has_many :classifications, through: :boats



  def self.catamaran_operators
    self.joins(:classifications).where("classifications.name" => "Catamaran")
  end

  def self.sailors
    self.joins(:classifications).where("classifications.name" => "Sailboat").uniq
  end


  def self.motorboaters
    self.joins(:classifications).where("classifications.name" => "Motorboat").uniq
  end


  def self.talented_seamen
    self.sailors.where(id: self.motorboaters.ids)
  end

  def self.non_sailors
    self.all.where.not(id: self.sailors.ids)
  end










end
