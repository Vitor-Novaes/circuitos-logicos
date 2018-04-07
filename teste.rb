=begin
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
=end
bits = 3

lines = 2**bits
puts "#{lines}"