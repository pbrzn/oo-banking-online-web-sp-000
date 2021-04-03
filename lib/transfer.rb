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
    if self.valid?
      sender.balance-=@amount
      receiver.balance+=@amount
      @status = "complete"
    elsif !self.valid? || self.status=="complete"
      self.status="rejected"
      puts "Transaction rejected. Please check your account balance."
    end
  end
end
