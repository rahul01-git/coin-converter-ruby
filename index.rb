require './manager'

def clear_screen
  system('cls')
  system('clear')
end

def sub_menu(manager, to)
  clear_screen
  coin_list = manager.coin_list
  puts "Available Coins".center(50, ' ')
  puts
  puts coin_list.join(', ').center(50, '-')
  print "Coin: "
  symbol = gets.chomp.upcase
  print "Amount: "
  amount = gets.chomp.to_i

  if coin_list.include? symbol
    result = manager.calculate(amount,symbol, to)
    puts " #{amount} #{symbol}  = #{result} #{to} ".center(50, '-')
  else
    puts " #{symbol} is not available ".center(50,'*')
  end

  puts 
  print "Continue(y/n): "
  quit = gets.chomp.downcase
  exit if quit != 'y'
end


def menu
  loop do
    clear_screen
    manager = Manager.new
    puts " CRYPTO COIN CONVERTER ".center(50, '=')
    puts "Enter your choice"
    puts "a) Convert to USD"
    puts "b) Convert to EUR"
    puts "c) Convert to INR"
    puts "q) Quit"
    print "Action: "
    choice = gets.chomp.downcase

    if choice == 'q'
      puts 
      puts "Thank you for using our app !!"
      break
    else
      case choice
      when 'a' then sub_menu(manager, 'USD')
      when 'b' then sub_menu(manager, 'EUR')
      when 'c' then sub_menu(manager, 'INR')
      else puts "invalid selection !!"
      end
    end
  end
end


menu