#require_relative 'Class_strings'
require_relative 'manipulacao_txt'

# retornar número de portas (string)
def f_num_portas(text_content)
	str_portas = text_content[0] 
	for char in 1..str_portas.size-1
		unless str_portas[char] == ',' || str_portas[char] == ' ' || str_portas[char] == '\n'
			return str_portas[char]
		end
	end
end

#retorna número de bits (string)
def f_num_bits (text_content)
	str_portas = text_content[0] 
	bits = str_portas[0]
	bits
end

#Constroi tabela verdade
def f_one_bit
	tverdade = ["0","1"]
	tverdade
end

def f_two_bits
	tverdade = []
	for e1 in 0..1
		for e2 in 0..1
			line = ""
			line << "#{e1}  #{e2}"
			tverdade << line
		end
	end
	tverdade
end

def f_three_bits
	tverdade = []
	for e1 in 0..1
		for e2 in 0..1
			for e3 in 0..1
				line = ""
				line << "#{e1}  #{e2}  #{e3}"
				tverdade << line
			end
		end
	end
	tverdade
end

def f_four_bits
	tverdade = []
	for e1 in 0..1
		for e2 in 0..1
			for e3 in 0..1
				for e4 in 0..1
					line = ""
					line << "#{e1}  #{e2}  #{e3}  #{e4}  "
					tverdade << line
				end
			end
		end
	end
	puts tverdade
	tverdade
end

def f_five_bits
	tverdade = []
	for e1 in 0..1
		for e2 in 0..1
			for e3 in 0..1
				for e4 in 0..1
					for e5 in 0..1
						line = ""
						line << "#{e1}  #{e2}  #{e3}  #{e4}  #{e5}  "
						tverdade << line
					end
				end
			end
		end
	end
	puts tverdade
	tverdade
end

#gera tabela verdade de acordo com os bits
def f_gera_tv(bits)
	tverdade = []
		case bits
		when '1'
			tverdade = f_one_bit
		when '2'
			tverdade = f_two_bits
		when '3'
			tverdade = f_three_bits
		when '4'
			tverdade = f_four_bits
		when '5'
			tverdade = f_five_bits
		else
			puts "Número de BITS não suportado: v2.1.0 : Somente até 5 bits de entrada"		
		end
	tverdade
end

#verifica entradas e retorna um array somente da entrada dos params e uma string com os params >> f_operações...
def f_verifica_entradas(text_line,valores)
	entradas = ""
	aux2 = 1 # AUX para E2
	aux3 = 2 # AUX para E3
	entrada_buf = text_line.size-3 # pegar o elemento de Sx
	puts text_line

	#caso tenha Porta NOT
	if text_line.include? "NOT"
		unless text_line.include? "S"
			if valores.size == 64
			aux2 = 1
			aux3 = 2
			aux4 = 3
			for c in 0..valores.size-1
			if c%4 == 0
				@E1 << valores[c]
			elsif c == 1 or c == aux2
				aux2 += 4
				@E2 << valores[c]
			elsif c == 2 or c == aux3
				aux3 += 4
				@E3 << valores[c]
			elsif c == 3 or c == aux4
				aux4 += 4
				@E4 << valores[c]
			end
			end
			aux4 = 0
			aux3 = 0
			aux2 = 0
			elsif valores.size == 160
			aux2 = 1
			aux3 = 2
			aux4 = 3
			aux5 = 4
			for c in 0..valores.size-1
				if c%5 == 0
					@E1 << valores[c]
				elsif c == 1 or c == aux2
					aux2 += 5
					@E2 << valores[c]
				elsif c == 2 or c == aux3
					aux3 += 5
					@E3 << valores[c]
				elsif c == 3 or c == aux4
					aux4 += 5
					@E4 << valores[c]
				elsif c == 4 or c == aux5
					aux5 += 5
					@E5 << valores[c]
				end
			end
			aux2 = 0
			aux3 = 0
			aux4 = 0
			aux5 = 0
			end
		end

		if valores.size == 2 and text_line.include? "E1"
			@E1 = valores
			puts "nE1"
			return "nE1"
		elsif valores.size == 2 and text_line.include? "S"
			entradas = "nS"
			entradas << text_line[entrada_buf-1]
			puts entradas
			return entradas
		elsif valores.size == 8 and text_line.include? "E1"
			for c in 0..valores.size-1
				if c%2 == 0
					@E1 << valores[c]
				end
			end
			return "nE1"
		elsif valores.size == 8 and text_line.include? "E2"
			for c in 0..valores.size-1
				if c%2 != 0
					@E2 << valores[c]
				end
			end
			return "nE2"
		elsif valores.size == 8 and text_line.include? "S"
			entradas = "nS"
			entradas << text_line[entrada_buf-1]
			puts entradas
			return entradas
		elsif valores.size == 24 and text_line.include? "E1"
			for c in 0..valores.size-1
				if c%3 == 0
					@E1 << valores[c]
				end
			end
			return "nE1"
		elsif valores.size == 24 and text_line.include? "E2"
			for c in 0..valores.size-1
				if c == 1 or c == aux2
					aux2 += 3
					@E2 << valores[c]
				end
			end
			aux2 = 0
			return "nE2"
		elsif valores.size == 24 and text_line.include? "E3"
			for c in 0..valores.size-1
				if c == 2 or c == aux3
					aux3 += 3
					@E3 << valores[c]
				end
			end
			aux3 = 0
			return "nE3"
		elsif valores.size == 24 and text_line.include? "S"
			entradas = "nS"
			entradas << text_line[entrada_buf-1]
			puts entradas
			return entradas
		elsif valores.size == 64 and text_line.include? "E1"
			return "nE1"
		elsif valores.size == 64 and text_line.include? "E2"
			return "nE2"
		elsif valores.size == 64 and text_line.include? "E3"
			return "nE3"
		elsif valores.size == 64 and text_line.include? "E4"
			return "nE4"
		elsif valores.size == 64 and text_line.include? "S"
			entradas = "nS"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif valores.size == 160 and text_line.include? "E1"
			return "nE1"
		elsif valores.size == 160 and text_line.include? "E2"
			return "nE2"
		elsif valores.size == 160 and text_line.include? "E3"
			return "nE3"
		elsif valores.size == 160 and text_line.include? "E4"
			return "nE4"
		elsif valores.size == 160 and text_line.include? "E5"
			return "nE5"
		elsif valores.size == 160 and text_line.include? "S"
			entradas = "nS"
			entradas << text_line[entrada_buf-1]
			return entradas
		end	
	end

	case valores.size
	#1 bit
	when 2
		if text_line.include? "E1" 
			@E1 = valores
			return entradas << "E1"
		else
			if text_line.include? "(S"
				entradas << "S"
				entradas << text_line[entrada_buf]
				puts entradas
				return entradas
			end
		end
	#2 bits obs: Possibilidade: (E1,E1) (E2,E2) // possibilidade (Sx) 
	when 8
		if text_line.include? "E1" and text_line.include? "E2" #(E1,E2)
			for c in 0..valores.size-1
				if c%2 == 0
					@E1 << valores[c]
				else
					@E2 << valores[c]
				end
			end
			return entradas << "E1E2"
		elsif text_line.include? "E1" and text_line.include? ",S" #(E1,Sx)
			for c in 0..valores.size-1
				if c%2 == 0
					@E1 << valores[c]
				end
			end
			entradas << "E1S"
			entradas << text_line[entrada_buf-1]
			return f_verifica_entradas
		elsif text_line.include? "E2" and text_line.include? ",S" #(E2,Sx)
			for c in 0..valores.size-1
				if c%2 != 0
					@E2 << valores[c]
				end
			end
			entradas << "E2S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? ",S" and text_line.include? "(S" #(Sx,Sy)
			entradas << "S"
			entradas << text_line[entrada_buf-4]
			entradas << "S"
			entradas << text_line[entrada_buf-1]
			puts entradas
			return entradas
		end
	#3 bits obs : SxSy nn implementado
	when 24
		aux2 = 1
		aux3 = 2
		if text_line.include? "E1" and text_line.include? "E2" #(E1,E2)
			for c in 0..valores.size-1
				if c%3 == 0
					@E1 << valores[c]
				elsif c == 1 or c == aux2
					aux2 += 3
					@E2 << valores[c]
				end
			end
			aux2 = 0
			return entradas << "E1E2"
		elsif text_line.include? "E1" and text_line.include? "E3" #(E1,E3)
			for c in 0..valores.size-1
				if c%3 == 0
					@E1 << valores[c]
				elsif c == 2 or c == aux3
					aux3 += 3
					@E3 << valores[c]
				end
			end
			aux3 = 0
			return entradas << "E1E3"
		elsif text_line.include? "E2" and text_line.include? "E3" #(E2,E3)
			for c in 0..valores.size-1
				if c == 1 or c == aux2
					aux2 += 3
					@E2 << valores[c]
				elsif c == 2 or c == aux3
					aux3 += 3
					@E3 << valores[c]
				end
			end
			aux2 = 0
			aux3 = 0
			return entradas << "E2E3"
		elsif text_line.include? "E1" and text_line.include? ",S" #(E1,Sx)
			for c in 0..valores.size-1
				if c%3 == 0
					@E1 << valores[c]
				end
			end
			entradas << "E1S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E2" and text_line.include? ",S" #(E2,Sx)
			for c in 0..valores.size-1
				if c == 1 or c == aux2
					aux2 += 3
					@E2 << valores[c]
				end
			end
			aux2 = 0
			entradas << "E2S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E3" and text_line.include? ",S" #(E3,Sx)
			for c in 0..valores.size-1
				if c == 2 or c == aux3
					aux3 += 3
					@E3 << valores[c]
				end
			end
			aux3 = 0
			entradas << "E3S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? ",S" and text_line.include? "(S" #(Sx,Sy)
			entradas << "S"
			entradas << text_line[entrada_buf-4]
			entradas << "S"
			entradas << text_line[entrada_buf-1]
			puts entradas
			return entradas
		end
	when 64
		aux2 = 1
		aux3 = 2
		aux4 = 3
		for c in 0..valores.size-1
			if c%4 == 0
				@E1 << valores[c]
			elsif c == 1 or c == aux2
				aux2 += 4
				@E2 << valores[c]
			elsif c == 2 or c == aux3
				aux3 += 4
				@E3 << valores[c]
			elsif c == 3 or c == aux4
				aux4 += 4
				@E4 << valores[c]
			end
		end
		aux4 = 0
		aux3 = 0
		aux2 = 0

		if text_line.include? "E1" and text_line.include? "E2" #(E1,E2)
			return "E1E2"
		elsif text_line.include? "E1" and text_line.include? "E3" #(E1,E3)
			return "E1E3"
		elsif text_line.include? "E1" and text_line.include? "E4" #(E1,E4)
			return "E1E4"
		elsif text_line.include? "E2" and text_line.include? "E3" #(E2,E3)
			return "E2E3"
		elsif text_line.include? "E2" and text_line.include? "E4" #(E2,E4)
			return "E2E4"
		elsif text_line.include? "E3" and text_line.include? "E4" #(E3,E4)
			return "E3E4"
		elsif text_line.include? "E1" and text_line.include? ",S" #(E1,Sx)
			entradas = "E1S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E2" and text_line.include? ",S" #(E2,Sx)
			entradas = "E2S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E3" and text_line.include? ",S" #(E3,Sx)
			entradas = "E3S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E4" and text_line.include? ",S" #(E4,Sx)
			entradas = "E4S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "(S" and text_line.include? ",S" #(Sx,Sy)
			entradas = "S"
			entradas << text_line[entrada_buf-4]
			entradas << "S"
			entradas << text_line[entrada_buf-1]
			return entradas
		end
	when 160
		aux2 = 1
		aux3 = 2
		aux4 = 3
		aux5 = 4
		for c in 0..valores.size-1
			if c%5 == 0
				@E1 << valores[c]
			elsif c == 1 or c == aux2
				aux2 += 5
				@E2 << valores[c]
			elsif c == 2 or c == aux3
				aux3 += 5
				@E3 << valores[c]
			elsif c == 3 or c == aux4
				aux4 += 5
				@E4 << valores[c]
			elsif c == 4 or c == aux5
				aux5 += 5
				@E5 << valores[c]
			end
		end
		aux2 = 0
		aux3 = 0
		aux4 = 0
		aux5 = 0

		if text_line.include? "E1" and text_line.include? "E2" #(E1,E2)
			return "E1E2"
		elsif text_line.include? "E1" and text_line.include? "E3" #(E1,E3)
			return "E1E3"
		elsif text_line.include? "E1" and text_line.include? "E4" #(E1,E4)
			return "E1E4"
		elsif text_line.include? "E1" and text_line.include? "E5" #(E1,E5)
			return "E1E5"
		elsif text_line.include? "E2" and text_line.include? "E3" #(E2,E3)
			return "E2E3"
		elsif text_line.include? "E2" and text_line.include? "E4" #(E2,E4)
			return "E2E4"
		elsif text_line.include? "E2" and text_line.include? "E5" #(E2,E5)
			return "E2E5"
		elsif text_line.include? "E3" and text_line.include? "E4" #(E3,E4)
			return "E3E4"
		elsif text_line.include? "E3" and text_line.include? "E5" #(E3,E5)
			return "E3E5"
		elsif text_line.include? "E4" and text_line.include? "E5" #(E4,E5)
			return "E4E5"
		elsif text_line.include? "E1" and text_line.include? ",S" #(E1,Sx)
			entradas = "E1S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E2" and text_line.include? ",S" #(E2,Sx)
			entradas = "E2S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E3" and text_line.include? ",S" #(E3,Sx)
			entradas = "E3S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E4" and text_line.include? ",S" #(E4,Sx)
			entradas = "E4S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "E5" and text_line.include? ",S" #(E5,Sx)
			entradas = "E5S"
			entradas << text_line[entrada_buf-1]
			return entradas
		elsif text_line.include? "(S" and text_line.include? ",S" #(Sx,Sy)
			entradas = "S"
			entradas << text_line[entrada_buf-4]
			entradas << "S"
			entradas << text_line[entrada_buf-1]
			puts "#{entradas}"
			return entradas
		end
	end
end

def f_operações_lógicas(tverdade,text_content,valores,bits)
	# analisando e chamando operações lógicas
	for c in 0..text_content.size-1
		if text_content[c].include? " AND" #OKAY
			text_line = text_content[c] # pego linha de string e inicializo text_line
			entradas = f_verifica_entradas(text_line,valores)
			montante = f_and(valores,@bits,entradas)
			f_montante_sx_armazena(montante)
			#f_write(tverdade,@bits,montante)
		else
			if text_content[c].include? " OR" #OKAY
				text_line = text_content[c]
				entradas = f_verifica_entradas(text_line,valores)
				montante = f_or(valores,@bits,entradas)
				f_montante_sx_armazena(montante)
				#f_write(tverdade,@bits,resultante)
			else
				if text_content[c].include? " XOR" #OKAY
					text_line = text_content[c]
					entradas = f_verifica_entradas(text_line,valores)
					montante = f_xor(valores,@bits,entradas)
					f_montante_sx_armazena(montante)
					#f_write(tverdade,@bits,resultante)
				else
					if text_content[c].include? " NAND" #OKAY
						text_line = text_content[c]
						entradas = f_verifica_entradas(text_line,valores)
						montante = f_and(valores,@bits,entradas)
						montante_final = f_nand(montante,@bits)
						f_montante_sx_armazena(montante_final)
						#f_write(tverdade,@bits,resultante)	
					else
						if text_content[c].include? " NOR" #OKAY
							text_line = text_content[c]
							entradas = f_verifica_entradas(text_line,valores)
							montante = f_or(valores,@bits,entradas)
							montante_final = f_nor(montante,@bits)
							f_montante_sx_armazena(montante_final)
							#f_write(tverdade,@bits,resultante)	
						else
							if text_content[c].include? " NOT" #OKAY
								text_line = text_content[c] 
								# entradas = f_verifica_entradas(text_line,valores)
								# montante = f_not(valores,@bits,entradas)
								# f_montante_sx_armazena(montante)
								# text_line = text_content[c]
								entradas = f_verifica_entradas(text_line,valores)
								montante = f_not(valores,@bits,entradas)
								f_montante_sx_armazena(montante)
								#f_write(tverdade,@bits,montante)
							else
								if text_content[c].include? "F =" #OKAY
									entradas = text_content[c]
									puts "Saida : #{entradas} \n"
									resultante = f_montante_sx(entradas)
									f_write(tverdade,@bits,resultante)
								else
									next	
								end
							end
						end		
					end
				end
			end
		end
	end
end

def f_valores_verdade(tverdade,bits)
	 valores = []
		# Quebrando a tabela verdade em string
		for c in 0..tverdade.size-1
		 	case @bits
		 	when '1'
		 		puts "#{tverdade}"
		 		return tverdade
		 	when '2'
		 		tv = tverdade[c].split "  "
		 		valores << tv[0].to_s
				valores << tv[1].to_s
		 	
			when '3'
				tv = tverdade[c].split "  "
			 	valores << tv[0].to_s
				valores << tv[1].to_s
				valores << tv[2].to_s
		 	when  '4'
		 		tv = tverdade[c].split "  "
			 	valores << tv[0].to_s
				valores << tv[1].to_s
				valores << tv[2].to_s
				valores << tv[3].to_s
			else
				tv = tverdade[c].split "  "
			 	valores << tv[0].to_s
				valores << tv[1].to_s
				valores << tv[2].to_s
				valores << tv[3].to_s
				valores << tv[4].to_s
		 	end
		end
		puts "#{valores}"
		puts "#{valores[0].class}"
		valores
end

def f_and(valores,bits,entradas)
	sd = [] # array de saida
	sx = [] # array no caso de montantes Sx
	params = entradas
	ent = ""

	cnt = entradas.count 'S'

	if cnt == 1
	    sx = f_montante_sx(entradas)
	    for i in 0..entradas.size-2
		    ent << entradas[i]			
		end
		ent << "x"
		params = ent
		puts "#{params}"
	elsif cnt == 2
		sx = f_montante_sx(entradas)
		params = "SS"
	end
	lines = 2**bits.to_i # quantidade de repetições

	case(bits.to_i)
	when 2
		case params
		when "E1E2"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E2[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if @E1[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if @E2[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "SS"
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end
			for c in 0..lines-1
			   if aux_x[c] == "1" and aux_y[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	when 3
		case params
		when "E1E2"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E2[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if @E2[c] == "1" and @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if @E1[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if @E2[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if @E3[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "SS"
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end
			for c in 0..lines-1
			   if aux_x[c] == "1" and aux_y[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	when 4
		case params
		when "E1E2"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E2[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E4"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if @E2[c] == "1" and @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E4"
			for c in 0..lines-1
			   if @E2[c] == "1" and @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3E4"
			for c in 0..lines-1
			   if @E3[c] == "1" and @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if @E1[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if @E2[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if @E3[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E4Sx"
			for c in 0..lines-1
			   if @E4[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "SS"
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end
			for c in 0..lines-1
			   if aux_x[c] == "1" and aux_y[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	when 5
		case params
		when "E1E2"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E2[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E4"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E5"
			for c in 0..lines-1
			   if @E1[c] == "1" and @E5[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if @E2[c] == "1" and @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E4"
			for c in 0..lines-1
			   if @E2[c] == "1" and @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E5"
			for c in 0..lines-1
			   if @E2[c] == "1" and @E5[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3E4"
			for c in 0..lines-1
			   if @E3[c] == "1" and @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3E5"
			for c in 0..lines-1
			   if @E3[c] == "1" and @E5[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E4E5"
			for c in 0..lines-1
			   if @E4[c] == "1" and @E5[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if @E1[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if @E2[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if @E3[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E4Sx"
			for c in 0..lines-1
			   if @E4[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E5Sx"
			for c in 0..lines-1
			   if @E5[c] == "1" and sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "SS"
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end
			for c in 0..lines-1
			   if aux_x[c] == "1" and aux_y[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	end		
end

def f_or(valores,bits,entradas)
	sd = [] # array de saida
	sx = [] # array no caso de montantes Sx
	params = entradas
	ent = ""
	cnt = entradas.count 'S'

	if cnt == 1
	    sx = f_montante_sx(entradas)
	    for i in 0..entradas.size-2
		    ent << entradas[i]
		end
		ent << "x"
		params = ent
		puts "#{params}"
	elsif cnt == 2
		sx = f_montante_sx(entradas)
		params = "SS"
	end
	
	lines = 2**bits.to_i # quantidade de repetições

	case(bits.to_i)
	when 1
	when 2
		case params
		when "E1E2"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E2[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if @E1[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if @E2[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "SS"
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					puts "entrei"
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end

			for c in 0..lines-1
			   if aux_x[c] == "1" or aux_y[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	when 3
		case params
		when "E1E2"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E2[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if @E2[c] == "1" or @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1Sx" 
			for c in 0..lines-1
			   if @E1[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if @E2[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if @E3[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		else
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end
			for c in 0..lines-1
			   if aux_x[c] == "1" or aux_y[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	when 4
		case params
		when "E1E2"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E2[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E4"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if @E2[c] == "1" or @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E4"
			for c in 0..lines-1
			   if @E2[c] == "1" or @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3E4"
			for c in 0..lines-1
			   if @E3[c] == "1" or @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if @E1[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if @E2[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if @E3[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E4Sx"
			for c in 0..lines-1
			   if @E4[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "SS"
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end
			for c in 0..lines-1
			   if aux_x[c] == "1" or aux_y[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	when 5
		case params
		when "E1E2"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E2[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E4"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1E5"
			for c in 0..lines-1
			   if @E1[c] == "1" or @E5[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if @E2[c] == "1" or @E3[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E4"
			for c in 0..lines-1
			   if @E2[c] == "1" or @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2E5"
			for c in 0..lines-1
			   if @E2[c] == "1" or @E5[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3E4"
			for c in 0..lines-1
			   if @E3[c] == "1" or @E4[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3E5"
			for c in 0..lines-1
			   if @E3[c] == "1" or @E5[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E4E5"
			for c in 0..lines-1
			   if @E4[c] == "1" or @E5[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if @E1[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if @E2[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if @E3[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E4Sx"
			for c in 0..lines-1
			   if @E4[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "E5Sx"
			for c in 0..lines-1
			   if @E5[c] == "1" or sx[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		when "SS"
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end
			for c in 0..lines-1
			   if aux_x[c] == "1" or aux_y[c] == "1" 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	end
end

def f_xor(valores,bits,entradas)
	#case bits
	sd = [] # array de saida
	sx = [] # array no caso de montantes Sx
	params = entradas
	ent = ""
	cnt = entradas.count "S"

	if cnt == 1
	    sx = f_montante_sx(entradas)
	    for i in 0..entradas.size-2
		    ent << entradas[i]			
		end
		ent << "x"
		params = ent
		puts "#{params}"
	elsif cnt == 2
		sx = f_montante_sx(entradas)
		params = "SS"
	end
	
	lines = 2**bits.to_i # quantidade de repetições
	case(bits.to_i)
	when 1
	when 2
		case params
		when "E1E2"
			for c in 0..lines-1
			   	if (@E1[c] == "1" and @E2[c] == "1") or (@E1[c] == "0" and @E2[c] == "0")
		   			sd << "0"
		  		else
		   			sd << "1"
		   		end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   	if (@E1[c] == "1" and sx[c] == "1") or (@E1[c] == "0" and sx[c] == "0")
		   			sd << "0"
		  		else
		   			sd << "1"
		   		end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   	if (@E2[c] == "1" and sx[c] == "1") or (@E2[c] == "0" and sx[c] == "0")
		   			sd << "0"
		  		else
		   			sd << "1"
		   		end
			end
			puts sd
			return sd
		else
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					puts "entrei"
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end
			for c in 0..lines-1
			   if (aux_x[c] == "1" and aux_y[c] == "1") or (aux_x[c] == "0" and aux_y[c] == "0") 
			   		sd << "1"
			   else
			   		sd << "0"
			   end
			end
			puts sd
			return sd
		end
	when 3
		case params
		when "E1E2"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E2[c] == "1") or (@E2[c] == "0" and @E1[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E3[c] == "1") or (@E1[c] == "0" and @E3[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if (@E3[c] == "1" and @E2[c] == "1") or (@E2[c] == "0" and @E3[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if (@E1[c] == "1" and sx[c] == "1") or (@E1[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if (@E2[c] == "1" and sx[c] == "1") or (@E2[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if (@E3[c] == "1" and sx[c] == "1") or (@E3[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		else
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					puts "entrei"
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end

			for c in 0..lines-1
			   if (aux_x[c] == "1" and aux_y[c] == "1") or (aux_x[c] == "0" and aux_y[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		end
	when 4
		case params
		when "E1E2"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E2[c] == "1") or (@E2[c] == "0" and @E1[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E3[c] == "1") or (@E1[c] == "0" and @E3[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1E4"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E4[c] == "1") or (@E1[c] == "0" and @E4[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if (@E3[c] == "1" and @E2[c] == "1") or (@E2[c] == "0" and @E3[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2E4"
			for c in 0..lines-1
			   if (@E2[c] == "1" and @E4[c] == "1") or (@E2[c] == "0" and @E4[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E3E4"
			for c in 0..lines-1
			   if (@E3[c] == "1" and @E4[c] == "1") or (@E3[c] == "0" and @E4[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if (@E1[c] == "1" and sx[c] == "1") or (@E1[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if (@E2[c] == "1" and sx[c] == "1") or (@E2[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if (@E3[c] == "1" and sx[c] == "1") or (@E3[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E4Sx"
			for c in 0..lines-1
			   if (@E4[c] == "1" and sx[c] == "1") or (@E4[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		else
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					puts "entrei"
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end

			for c in 0..lines-1
			   if (aux_x[c] == "1" and aux_y[c] == "1") or (aux_x[c] == "0" and aux_y[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		end
	when 5
		case params
		when "E1E2"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E2[c] == "1") or (@E2[c] == "0" and @E1[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1E3"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E3[c] == "1") or (@E1[c] == "0" and @E3[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1E4"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E4[c] == "1") or (@E1[c] == "0" and @E4[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1E5"
			for c in 0..lines-1
			   if (@E1[c] == "1" and @E5[c] == "1") or (@E1[c] == "0" and @E5[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2E3"
			for c in 0..lines-1
			   if (@E3[c] == "1" and @E2[c] == "1") or (@E2[c] == "0" and @E3[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2E4"
			for c in 0..lines-1
			   if (@E2[c] == "1" and @E4[c] == "1") or (@E2[c] == "0" and @E4[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2E5"
			for c in 0..lines-1
			   if (@E2[c] == "1" and @E5[c] == "1") or (@E2[c] == "0" and @E5[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E3E4"
			for c in 0..lines-1
			   if (@E3[c] == "1" and @E4[c] == "1") or (@E3[c] == "0" and @E4[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E3E5"
			for c in 0..lines-1
			   if (@E3[c] == "1" and @E5[c] == "1") or (@E3[c] == "0" and @E5[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E1Sx"
			for c in 0..lines-1
			   if (@E1[c] == "1" and sx[c] == "1") or (@E1[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E2Sx"
			for c in 0..lines-1
			   if (@E2[c] == "1" and sx[c] == "1") or (@E2[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E3Sx"
			for c in 0..lines-1
			   if (@E3[c] == "1" and sx[c] == "1") or (@E3[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E4Sx"
			for c in 0..lines-1
			   if (@E4[c] == "1" and sx[c] == "1") or (@E4[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		when "E5Sx"
			for c in 0..lines-1
			   if (@E5[c] == "1" and sx[c] == "1") or (@E5[c] == "0" and sx[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		else
			aux_x = []
			aux_y = []
			for x in 0..1
				if x == 0 
					puts "entrei"
					@XY[x].each do |bit|
						aux_x << bit
					end
				else
					@XY[x].each do |bit|
						aux_y << bit
					end	
				end
			end

			for c in 0..lines-1
			   if (aux_x[c] == "1" and aux_y[c] == "1") or (aux_x[c] == "0" and aux_y[c] == "0")
			   		sd << "0"
			   else
			   		sd << "1"
			   end
			end
			puts sd
			return sd
		end
	end
end

def f_not(valores,bits,entradas)
	#case bits
	sd = [] # array de saida
	sx = [] # array no caso de montantes Sx
	params = entradas

	if params.include? "S"
	    sx = f_montante_sx(params)
		puts "#{params}"
	end

	lines = 2**bits.to_i
	case bits.to_i
	when 1
		if params == "nE1" 
			for c in 0..lines-1
				if @E1[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
		elsif params.include? "nS"
			for c in 0..lines-1
				if sx[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
		end
		puts sd
		return sd
	when 2
		if params == "nE1" 
			for c in 0..lines-1
				if @E1[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end
			puts sd
			return sd
		elsif params == "nE2" 
			for c in 0..lines-1
				if @E2[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd
		elsif params.include? "nS" 
			for c in 0..lines-1
				if sx[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd
		end
	when 3
		if params == "nE1" 
			for c in 0..lines-1
				if @E1[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end
			puts sd
			return sd
		elsif params == "nE2" 
			for c in 0..lines-1
				if @E2[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd
		elsif params == "nE3" 
			for c in 0..lines-1
				if @E3[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd		
		elsif params.include? "nS" 
			for c in 0..lines-1
				if sx[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd
		end
	when 4
		if params == "nE1" 
			for c in 0..lines-1
				if @E1[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end
			puts sd
			return sd
		elsif params == "nE2" 
			for c in 0..lines-1
				if @E2[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd
		elsif params == "nE3" 
			for c in 0..lines-1
				if @E3[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd		
		elsif params == "nE4" 
			for c in 0..lines-1
				if @E4[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd		
		elsif params.include? "nS" 
			for c in 0..lines-1
				if sx[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd
		end
	else
		if params == "nE1" 
			for c in 0..lines-1
				if @E1[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end
			puts sd
			return sd
		elsif params == "nE2" 
			for c in 0..lines-1
				if @E2[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd
		elsif params == "nE3" 
			for c in 0..lines-1
				if @E3[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd		
		elsif params == "nE4" 
			for c in 0..lines-1
				if @E4[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd		
		elsif params == "nE5" 
			for c in 0..lines-1
				if @E5[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd		
		elsif params.include? "nS" 
			for c in 0..lines-1
				if sx[c] == "1"
					sd << "0"
				else
					sd << "1"
				end
			end	
			puts sd
			return sd
		end
	end
end

def f_nor(montante,bits)
	aux = []
	aux = montante;
	sd = []
	lines = 2**bits.to_i
	for c in 0..lines-1
		if (aux[c] == "1")
			sd << "0"
		else
			sd << "1"
		end
	end
	puts "Negado :"
	puts sd
	sd
end

def f_nand(montante,bits)
	sd = []
	lines = 2**bits.to_i

	for c in 0..lines-1
		if montante[c] == "1"
			sd << "0"
		else
			sd << "1"
		end
	end
	puts "Negado :"
	puts sd
	sd
end

def f_montante_sx_armazena(montante)
	@Sx << montante
	puts "Armazena : #{@Sx}"
end

# função que analisa o Sx
def f_montante_sx(entradas)
	if entradas.include? "S" and entradas.include? "E"
		posição = entradas[entradas.size-1]
		return @Sx[posição.to_i-1]
	
	elsif entradas.include? "nS" 
		posição = entradas[entradas.size-1]
		return @Sx[posição.to_i-1]

	elsif entradas.include? "F ="
		if entradas.include? "S"
			saida = entradas[entradas.size-3]
			return @Sx[saida.to_i-1]
		else
			case entradas[entradas.size-3]
			when "1"
				return @E1
			when "2"
				return @E2
			when "3"
				return @E3
			when "4"
				return @E4
			when "5"
				return @E5
			end						
		end	
	else
	 	posição_y = entradas[entradas.size-1]
		#puts entradas[entradas.size-1]
		posição_x = entradas[entradas.size-3]
		#puts entradas[entradas.size-3]
		@XY[0] = @Sx[posição_x.to_i-1]
		@XY[1] = @Sx[posição_y.to_i-1]
		return @XY
	end
end

#start program
def f_main
	@E1 = []
	@E2 = []
	@E3 = []
	@E4 = []
	@E5 = []
	@Sx = []
	@XY = []

	text_content = f_read #text_content é um array(strs lines) com as entradas
	portas = f_num_portas(text_content) #retornar o numero de portas
	@bits = f_num_bits(text_content) #retorna bits do circuito
	#f_print(text_content)
	
	puts "#{@bits}: bits "
	puts "#{portas}: portas"
	
	#gera tabela verdade de acordo com os bits
	tverdade = f_gera_tv(@bits)


	valores = f_valores_verdade(tverdade,@bits) #valores.class: string(array)
	f_operações_lógicas(tverdade,text_content,valores,@bits)#decide qual função lógica chamar
end