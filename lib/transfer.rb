class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction
    sender.balance-=@amount
    receiver.balance+=@amount
    @status = "complete"
    if self.status == "complete"
      !self.valid?
    end
  end
end
