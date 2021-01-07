class Museum
  attr_reader :name,
              :exhibits,
              :patrons,
              :recommend

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @recommend = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @recommend = @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    hash = Hash.new { |hash, key| hash[key] = [] }

    @patrons.each do |patron|
      recommend_exhibits(patron).each do |exhibit|
        if hash[exhibit].nil?
          hash[exhibit] = patron
        else hash[exhibit] << patron
        end
      end
    end

    hash
  end

  def ticket_lottery_contestants(exhibit)

  end
end
