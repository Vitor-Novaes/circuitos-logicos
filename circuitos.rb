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
		else
			puts "Número de BITS não suportado: v1.1.0 : Somente até 3 bits de entrada"		
		end
	tverdade
end


# ERRO : IDENTIFICAÇÃO DA OPERAÇÃO
def f_operações_lógicas(tverdade,text_content,valores,bits)
	e = "AND"
	ou = "OR"
	não = "NOT"
	n_e = "NAND"
	n_ou = "NOR"
	x_ou = "XOR"

	# analisando e chamando operações lógicas
	for c in 0..text_content.size-1
		if text_content[c].include? e 
			resultante = f_and(valores)
			f_write(tverdade,@bits,resultante)
		else
			if text_content[c].include? ou 
				resultante = f_or(valores)
				f_write(tverdade,@bits,resultante)
			else
				if text_content[c].include? x_ou 
					resultante = f_xor(valores)
					f_write(tverdade,@bits,resultante)
				else
					if text_content[c].include? não
						if @bits == 1
							resultante = f_not(valores)
							f_write(tverdade,@bits,resultante)
						else
							next
						end		
					end
				end
			end
		end
	end

	#... falta operações lógicas case : operações_lógicas.include? e,ou,não,n_e ...#
	
	#resultante = f_and(valores)	
	#resultante = f_or(valores)
	#resultante = f_not(valores) OBS ERRO: saida referente ao valores(array)
	#resultante = f_xor(valores)

	# CASE WHEN => OPREAÇAO LÓGICA (f_and ...)
end

def f_valores_verdade(tverdade,bits)
	 valores = []
	 if @bits == 1
	 	return tverdade
	 else 
		# Quebrando a tabela verdade em Fixnum
		for c in 0..tverdade.size-1
		 	tv = tverdade[c].split " "
		 	valores << tv[0].to_s
			valores << tv[1].to_s
		end
		puts "#{valores}"
		puts "#{valores[0].class}"
		valores
	end
end

def f_and(valores)
	sd = []
	aux = 0
	
	#case bits


	for c in 0..3
	   e1 = valores[aux].to_s
	   aux+= 1
	   e2 = valores[aux].to_s
	   aux+= 1
	   if e1 == "1" and e2 == "1" 
	   		sd << "1"
	   else
	   		sd << "0"
	   end
	end
	puts sd
	sd
end

def f_or(valores)
	sd = []
	aux = 0
	
	#case bits


	for c in 0..3
	   e1 = valores[aux].to_s
	   aux+= 1
	   e2 = valores[aux].to_s
	   aux+= 1
	   if e1 == "1" or e2 == "1" 
	   		sd << "1"
	   else
	   		sd << "0"
	   end
	end
	puts sd
	sd
end

#OBS: ERRO
def f_not(valores)
	sd = []
	for c in 0..1
		if valores[c] == "1"
			sd << "0"
		else
			sd << "1"
		end
	end	
	puts sd
	sd
end

def f_xor(valores)
	sd = []
	aux = 0
	#case bits


	for c in 0..3
	   e1 = valores[aux].to_s
	   aux+= 1
	   e2 = valores[aux].to_s
	   aux+= 1
	   if (e1 == "1" and e2 == "1") or (e1 == "0" and e2 == "0")
	   		sd << "1"
	   else
	   		sd << "0"
	   end
	end
	puts sd
	#sd
end

#start program
def f_main
	text_content = f_read #text_content é um array(strs) com as entradas
	portas = f_num_portas(text_content) #retornar o numero de portas
	@bits = f_num_bits(text_content) #retorna bits do circuito
	#f_print(text_content)
	
	puts "#{@bits}: bits "
	puts "#{portas}: portas"
	
	#gera tabela verdade de acordo com os bits
	tverdade = f_gera_tv(@bits)


	valores = f_valores_verdade(tverdade,@bits) #valores.class: Fixnum(array)
	f_operações_lógicas(tverdade,text_content,valores,@bits)#decide qual função lógica chamar



end