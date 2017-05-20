require "pry"

class Transfer

  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    false
    true if sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.sender.balance < amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    elsif @status == 'pending'
      self.sender.balance -= amount
      self.receiver.balance += amount
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      self.sender.balance += amount
      self.receiver.balance -= amount
      @status = 'reversed'
    end
  end


end
