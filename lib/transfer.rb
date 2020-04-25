require_relative "bank_account.rb"
require "pry"

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def find_bank_account(name)
    #finds bank account for that person
    BankAccount.all.find {|account| account.name == name}
  end


  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if self.status == "pending" && self.valid? && sender.balance > amount
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
    end

    # binding.pry
  end

def reverse_transfer
  if self.status == "complete" && self.valid? && receiver.balance > amount
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
  else
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end



end
