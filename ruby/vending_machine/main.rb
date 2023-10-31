require_relative './suica'
require_relative './juice'
require_relative './vendingmachine'

vendingmachine = Vendingmachine.new
vendingmachine.purchase('irohasu')
vendingmachine.assort('irohasu', 1)
vendingmachine.add(100)
vendingmachine.purchase('pepsi')
vendingmachine.assort('pepsi', 1)
vendingmachine.purchase('monster')
vendingmachine.assort('monster', 1)
vendingmachine.list