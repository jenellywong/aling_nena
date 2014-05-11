class MoneyCalculator

	attr_accessor :ones, :fives, :tens, :twenties, :fifties, :hundreds, :five_hundreds, :thousands

	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
	@ones = ones.to_i
	@fives = fives.to_i
	@tens = tens.to_i
	@twenties = twenties.to_i
	@fifties = fifties.to_i
	@hundreds = hundreds.to_i
	@five_hundreds = five_hundreds.to_i
	@thousands = thousands.to_i
	# each parameter represents the quantity per denomination of money
	# these parameters can be assigned to instance variables and used for computation
	@sum = @ones + @fives*5 + @tens*10 + @twenties*20 + @fifties*50 + @hundreds*100 + @five_hundreds*500 + @thousands*1000
    
	end
	
	def sum
		@sum
	end



	def change(item_price, number)
	@item_price = item_price.to_i
	@number = number.to_i
	@total_price = @item_price * @number
	

		#if @total_price > @sum
		#"Not enough money."
		#else
	@mchange = @total_price - @sum

	a = @mchange
	@nthousands, b = a.divmod(1000)
	@nfivehundreds, c = b.divmod(500)
	@nhundreds, d = c.divmod(100)
	@nfifties, e = d.divmod(50)
	@ntwenties, f = e.divmod(20)
	@ntens, g = f.divmod(10)
	@nfives, h = g.divmod(5)
	@nones = h
	
	{ :thousands => @nthousands, :five_hundreds => @nfivehundreds, :hundreds => @nhundreds, :fifties => @nfifties, :twenties => @ntwenties, :tens => @ntens, :fives => @nfives, :ones => @nones}
		#end

	# add a method called 'change' that takes in a parameter of how much an item costs
  	# and returns a hash of how much change is to be given
  	# the hash will use the denominations as keys and the amount per denomination as values
	# i.e. {:fives => 1, :fifties => 1, :hundreds => 3}
	end

	def mchange
		@mchange
	end

	def totalprice
		@totalprice
	end

end
