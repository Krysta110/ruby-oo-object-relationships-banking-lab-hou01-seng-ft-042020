

class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end
        
    def valid? 
        # is balance open status and balance >0, return true/false
        if (@balance > 0) && (@status == "open")
            return true
        else
            return false
        end
    end

    def close_account
        @status = "closed"
    end
end
