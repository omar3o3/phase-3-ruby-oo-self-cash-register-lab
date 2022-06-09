require 'pry'

class CashRegister


    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @cart = []
        @last_transaction = 0.0
    end

    attr_accessor :total , :discount , :cart , :last_transaction

    def add_item(title , price , quantity=1)
        quantity.times do
            self.cart << title
        end
        self.total = self.total += (price * quantity.to_f)
        self.last_transaction = price * quantity.to_f
    end

    def apply_discount
        if self.discount > 0
            self.discount = self.total * self.discount / 100
            self.total -= self.discount
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        self.cart
    end

    def void_last_transaction
        self.cart.pop
        self.total = self.total - self.last_transaction
    end

end

# binding.pry