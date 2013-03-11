accounts = [ { acc_num: 1000, name: 'Mike', pin: 12345, balance: 9_001.00 },
             { acc_num: 1001, name: 'Bill', pin: 12345, balance: 1_000_000.01 },
             { acc_num: 1002, name: 'Jack', pin: 12345, balance: 5_000_000.55 }
           ]

class Account

  def self.deposit(deposit, user, accounts)
    user[:balance] += deposit
    accounts.detect { |customer| customer[:acc_num] == user[:acc_num] }[:balance] = user[:balance]
  end

  def self.check(login, pin_num, accounts)
    accounts.each do |customer|
      if login == customer[:acc_num] && pin_num == customer[:pin]
        return customer
      else
        puts "\nInvalid entry!\n"
        return 'NOUSER'
      end
    end
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
          puts "[1]. Deposit \n" + "[2]. Withdraw \n" + "[3]. Quit \n\n"
          print 'Enter a option: '
          choice = gets.chomp
          case choice
          when "1"
            print "Deposit Amount: "
            deposit = gets.chomp.to_f
            if deposit >= 0
              new_balance = Account.deposit(deposit, user, accounts)
              puts "\n#{Time.now}: Transaction successfully completed. You deposited $#{deposit}.\n\n"
            else
              puts "\nError: You can't deposit a negative amount! Try withdrawing.\n\n"
            end
          when "2"
            puts "Withdrawing..."
          when "3"
            break
          end
        end
      #break
      else
        puts "Check your Account Number or to create a new account, type in 'create'! \n\n"
    end
  else
    puts 'Creating new user...'
    break
  end
end
