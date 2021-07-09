class CashRegister
  attr_accessor :total, :discount, :last_item_price

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @last_item_price = price * quantity
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @discount != 0
      @total = @total - (@total * @discount / 100)
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."    
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop
    if @items.length == 0
      @total = 0
    else
      @total -= @last_item_price
    end
  end
end
