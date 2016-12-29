module Seeds
  Dir[Rails.root.join('db', 'seeds', '**', '*')].each { |file| require file }
  Seeds::Languages.sprout
end
