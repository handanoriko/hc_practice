require_relative './suica'
require_relative './juice'
require_relative './vendingmachine'

vendingmachine = Vendingmachine.new
suica = Suica.new
# vendingmachine.purchase('irohasu', suica)

# vendingmachine.assort('irohasu', 1)
vendingmachine.charge(100, suica)
vendingmachine.purchase('pepsi', suica)

vendingmachine.assort('irohasu', 1)
vendingmachine.list
# vendingmachine.purchase('monster', suica)
# vendingmachine.list
# vendingmachine.assort('monster', 1)

# vendingmachine.charge(100, suica)
