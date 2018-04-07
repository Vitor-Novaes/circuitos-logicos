#leitura do txt excluindo comentários
def f_read
	text = []
	unless File.exists?("cld_01_e_falha.txt") #=> true?
		puts "File not found: cld_01_e_falha.txt"
	end


	File.open("cld_01_e_falha.txt", "r") do |f|
		f.each_line do |line|
		  #exclui comentarios
		  if line[0] == "%"
		  	next
		  end
		  text << line
	 	end
	end
	puts "#{text}\n\n"
	text

end

def f_print(text)
	for c in 0..text.size-1
		puts text[c]
	end
end

def f_write(tverdade,bits,resultante)
case @bits
when '1'
	saida = "E1 F
"	
when '2'
	saida = "E1 E2 F
"
else
	saida = "E1 E2 E3 F
"	
end
	
	for line in 0..tverdade.size-1
		saida << tverdade[line].to_s
		saida << " = "
		saida << resultante[line].to_s
		saida << "
"
	end


#escreve a função booleana





	File.write "out.txt",saida
end
