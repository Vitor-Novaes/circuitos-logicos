		aux2 = 1
		aux3 = 2
		aux4 = 3
		aux5 = 4
		teste = "."
		for c in 0..160
			if c%5 == 0
				teste << "E1"
			elsif c == 1 or c == aux2
				aux2 += 5
				teste << "E2"
			elsif c == 2 or c == aux3
				aux3 += 5
				teste << "E3"
			elsif c == 3 or c == aux4
				aux4 += 5
				teste << "E4"
			elsif c == 4 or c == aux5
				aux5 += 5
				teste << "E5"
			end
			puts "#{teste}"
			puts "\n"
		end
		aux2 = 0
		aux3 = 0
		aux4 = 0
		aux5 = 0


=begin
dados = [["CELULA", "LENNA", "JUL 01", "2015 12:00:00 AM", "N"], ["CELULA", "ARI", "JUL 01", "2015 12:00:00 AM", "P"]]
novo_array = []

dados.each do |x|
  array_filho = []
  
  array_filho.push(x[1])

  novo_array.push(array_filho)
end

p novo_array

def f_read
	file = File.read("cld_01_e_falha.txt")
	text_content = file.split "\n"


	text = []
	circuits = []
	letra_da_linha = [];
	aux = ""
	for teste in 0..text_content.size-1
		for char in text_content[teste].chars		
			if char == "%"
				break
			else

			end 
		end
	end



				if text[0] == "%"
					next
				else
					aux = text.to_s
					circuits << aux
				end
			end


	#for linha in 0..text_content.size-1
	#	if text_content[0] == "%"
	#		aux << text_content[0].to_s
	#		next
	#	else
	#		text << text_content[linha].to_s
	#	end	
	#end
	circuits
end

def f_print(circuits)
	puts "#{circuits}"
end


portas = [] # receber S1 ... S2 ...
tverdade = []

for e1 in 0..1
	for e2 in 0..1
		for e3 in 0..1
			line = ""
			line << "#{e1}#{e2}#{e3}"
			tverdade << line
		end
	end
end
puts "#{tverdade}"





text = '|_ ruby _|'
puts text.trim(' _|')  # both sides
puts text.ltrim(' _|') # left side
puts text.rtrim(' _|') # right side

if str[0] == "S" and str[1] == "#{line}"
			operações_lógicas << text_content[line]
		end



x = 10
y = 6

puts "#{x.to_s(2)}"
puts "#{y.to_s(2)}"
puts "#{x.to_s(2).class}"

operações_lógicas = []
	for line in 1..text_content.size-1
		str = " "
		str << text_content[line].to_s
		for char in str.chars
			if str[0] == "S" and str[1] == "#{line.to_s}"
				operações_lógicas << str
			end			
		end
	end

    ["0", "0", "0", "0", "0",
     "0", "0", "0", "0", "1", 
     "0", "0", "0", "1", "0",
     "0", "0", "0", "1", "1", 
     "0", "0", "1", "0", "0",
     "0", "0", "1", "0", "1",
     "0", "0", "1", "1", "0",
     "0", "0", "1", "1", "1", 
     "0", "1", "0", "0", "0", 
     "0", "1", "0", "0", "1", 
     "0", "1", "0", "1", "0", 
     "0", "1", "0", "1", "1", 
     "0", "1", "1", "0", "0", 
     "0", "1", "1", "0", "1", 
     "0", "1", "1", "1", "0", 
     "0", "1", "1", "1", "1", 
     "1", "0", "0", "0", "0", 
     "1", "0", "0", "0", "1", 
     "1", "0", "0", "1", "0", 
     "1", "0", "0", "1", "1", 
     "1", "0", "1", "0", "0", 
     "1", "0", "1", "0", "1", 
     "1", "0", "1", "1", "0", 
     "1", "0", "1", "1", "1", 
     "1", "1", "0", "0", "0", 
     "1", "1", "0", "0", "1", 
     "1", "1", "0", "1", "0", 
     "1", "1", "0", "1", "1", 
     "1", "1", "1", "0", "0", 
     "1", "1", "1", "0", "1", 
     "1", "1", "1", "1", "0", 
     "1", "1", "1", "1", "1"]

bits = 3

lines = 2**bits
puts "#{lines}"
=end