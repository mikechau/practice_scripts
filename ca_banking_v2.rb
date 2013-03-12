accounts = [ { acc_num: 1000, name: 'Mike', pin: 1234, balance: 9_001.00 },
             { acc_num: 1001, name: 'Bill', pin: 1234, balance: 1_000_000.01 },
             { acc_num: 1002, name: 'Jack', pin: 1234, balance: 5_000_000.55 }
           ]

class Account

  def initialize(name, initial, pin, accounts)
    acc_numb = accounts.last[:acc_num] + 1
    accounts << { acc_num: acc_numb, name: name, pin: pin, balance: initial }
    puts "\n#{name} your account has been successfully created.\n\n"
    puts "#{Time.now} - Account Details:"
    puts "Name: #{name}"
    puts "Account Number: #{acc_numb}"
    puts "Pin: #{pin}"
    puts "Balance: #{initial}"
    puts "\nPlease Login with your credentials.\n\n"
  end

  def self.update_balance(status, amount, user, accounts)
    if status == 'deposit'
      user[:balance] += amount
    elsif status == 'withdraw'
      user[:balance] -= amount
    else
      user[:balance] += 0.0
    end
    accounts.detect { |customer| customer[:acc_num] == user[:acc_num] }[:balance] = user[:balance]
  end

  def self.check(login, pin_num, accounts)
    find_account = accounts.detect { |customer| login == customer[:acc_num] && pin_num == customer[:pin] }
    return find_account ? find_account : 'NOUSER'
  end

end

while true

  print 'To login, please enter your Account Number: '
  login = gets.chomp.downcase

  if login != 'create'
    print 'Please enter your PIN: '
    pin_num = gets.chomp.to_i
    login = login.to_i
    user = Account.check(login, pin_num, accounts)
    if user != 'NOUSER'
      puts "\n" + "Hello #{user[:name]}! It is #{Time.now}. :) \n\n"
        while true
          puts "Current Balance: $#{user[:balance]} \n\n"
          puts "[d]. Deposit \n" + "[w]. Withdraw \n" + "[q]. Quit \n\n"
          print 'Enter a option: '
          choice = gets.chomp.downcase
          case choice
          when "d"
            print "Deposit Amount: "
            deposit = gets.chomp.to_f
            if deposit >= 0
              status = 'deposit'
              new_balance = Account.update_balance(status, deposit, user, accounts)
              puts "\n#{Time.now}: Transaction successfully completed. You deposited +$#{deposit}.\n\n"
            else
              puts "\nError: You can't deposit a negative amount! Try again.\n\n"
            end
          when "w"
            print "Withdrawal Amount: "
            withdraw = gets.chomp.to_f
            if withdraw >= 0 && withdraw <= user[:balance]
              status = 'withdraw'
              new_balance = Account.update_balance(status, withdraw, user, accounts)
              puts "\n#{Time.now}: Transaction successfully completed. You withdrew -$#{withdraw}.\n\n"
            elsif withdraw >= 0 && withdraw > user[:balance]
              puts "\nError: You are overdrawing your account by $#{(user[:balance] - withdraw).abs}! Try again.\n\n"
            else
              puts "\nError: You can't deposit a negative amount! Try again.\n\n"
            end
          when "q"
            break
          end
        end
      #break
      else
        puts "Check your Account Number or to create a new account, type in 'create'! \n\n"
    end
  else
    puts "\nCreating new user...\n\n"
    print "Name: "
    name = gets.chomp.split(' ').map {|w| w.capitalize }.join(' ')
    initial = 0.0
    pin = 0
    while initial <= 0
      print "Initial Deposit: "
      initial = gets.chomp.to_f
    end

    while pin < 0 || pin > 10000 || pin.to_s.length != 4
      print "4-Digit Pin: "
      pin = gets.chomp.to_i
    end

    Account.new(name, initial, pin, accounts)
  end
end
