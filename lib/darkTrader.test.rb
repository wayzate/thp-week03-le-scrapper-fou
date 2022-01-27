require './getCryptoHash.rb'

cryptoHash = getCryptoHash

puts "=== Pas d'erreur, notre hash contient #{cryptoHash.length} valeurs"
puts "=== La ou les crypto qui ont la plus grosse valeur."
puts cryptoHash.max_by{ |currencyName, currencyValuation| currencyValuation}
puts

puts "=== La ou les crypto qui ont la plus petite valeur."
puts cryptoHash.min_by{ |currencyName, currencyValuation| currencyValuation}
puts

puts "=== Les devises dont le cours est inférieur à 6000"
puts cryptoHash.select{ |currencyName, currencyValuation| currencyValuation.to_i < 6000 }
puts

puts "=== La devise la plus chère parmi celles dont le cours est inférieur à 6000."
puts cryptoHash
  .select{ |currencyName, currencyValuation| currencyValuation.to_i < 6000 }
  .max_by{ |currencyName, currencyValuation| currencyValuation.to_i }
puts
