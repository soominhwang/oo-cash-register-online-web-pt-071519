class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=nil)
    @total=0
    @discount = discount
    @transactions = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    @transactions << {title: title, quantity: quantity, amount: price * quantity}
  end

  def apply_discount
    if discount
      @total = @total - (@total * @discount/100)
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    last_transaction = @transactions.pop
    @total -= last_transaction[:amount]
    @total
  end
end
