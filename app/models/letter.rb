class Letter
  attr_reader :char

  def self.all
    ('A'..'Z').map { |c| new(c) }
  end

  def self.find(param)
    all.detect { |l| l.to_param == param }
  end

  def initialize(char)
    @char = char
  end

  def to_param
    @char.downcase
  end

  def activity_type
    ActivityType.find_all_by_name(:conditions => ["name LIKE ?", @char + '%'], :order => "name")
  end
end



