class Suica
    def initialize
        @price = 500
    end

    def price
        @price
    end

    def price=(price)
        @price = price
    end

    def charge(amount)
        raise "チャージは100円以上からです" if amount < 100 && 1 < amount
        @price += amount
    end
end