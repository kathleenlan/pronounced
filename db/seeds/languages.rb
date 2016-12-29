module Seeds
  class Languages
    def self.sprout
      Language.find_or_create_by(name: 'English')
    end
  end
end
