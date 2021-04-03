class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid? && self.status=="pending" ? true : false
  end
  
  def execute_transaction
    if self.valid?
      sender.balance-=@amount
      receiver.balance+=@amount
      self.status = "complete"
    else
      self.status="rejected"
    end
    if sender.balance==0 || receiver.balance==0
      "Transaction rejected. Please check your account balance."
    end
  end
end
