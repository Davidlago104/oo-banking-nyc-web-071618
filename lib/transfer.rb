require 'pry'
class Transfer
  attr_accessor :transfer, :sender, :receiver, :status

  def initialize(sender, receiver, transfer)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def amount
    @transfer
  end

  def valid?
    if sender.valid? && receiver.valid? == true
      return true
    else
      false
    end
  end

def execute_transaction
  if @status == "pending" && valid? && @sender.balance >= transfer
  @sender.balance -= transfer
  @receiver.balance += transfer
  @status = "complete"
else
  @status = "rejected"
  "Transaction rejected. Please check your account balance."
end
end

def reverse_transfer
  if @status == "complete"
    @sender.balance += transfer
    @receiver.balance -= transfer
    @status ="reversed"
  end
end

end #end of class
