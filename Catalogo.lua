-------------------------------------------------------
-- Classe Catalogo
-- Autor: Jeferson Batista
-------------------------------------------------------

dofile("Livro.lua")

-- Métodos
local Catalogo_methods = {
	ler = function(self)
		arquivo = io.open("catalogo.txt", "r")
		io.input(arquivo)
	
		local linhas = {}
		
		-- Lendo todo o catálogo linha por linha
		for linha in io.lines() do
			table.insert(linhas, linha)
		end
		
		num = #linhas
		i = 1
		
		while i <= num do            -- Até ler todas as linhas do arquivo
			codigo = tonumber(linhas[i]) or 0
			titulo = linhas[i+1]
			autor = linhas[i+2]
			assunto = linhas[i+3]
			
			strData = linhas[i+4]
			data = Data(strData)
			
			editora = linhas[i+5]
			
			-- Indo para a primeira linha do resumo
			i = i + 6
			resumo = ""
			while linhas[i] ~= "" do     -- Enquanto o resumo não terminar
				resumo = resumo .. linhas[i] .. "\n"
				i = i + 1
				if i > num then          -- Se o arquivo terminar, pare
					break
				end
			end
			
			livro = Livro(codigo, titulo, autor, assunto, data, editora, resumo)
			self:add(livro)
			
			-- Indo para o próximo livro
			i = i + 1
		end
		
		io.close(arquivo)
	end,
	
	registrar = function(self)
		registro = ""
		catalogo = self.livros
		for i = 1, #catalogo do
			registro = registro .. catalogo[i]:strLivro()
		end
		
		return registro
	end,
	
	escrever = function(self)
		catalogo = self.livros
		for i = 1, #catalogo do
			catalogo[i]:escrever()
		end
	end,
	
	add = function(self, livro)
		catalogo = self.livros
		table.insert(catalogo, livro)
	end,
	
	-- Função principal de ordenação
	sort = function(self, comparador)
		catalogo = self.livros
		quicksort(catalogo, 1, #catalogo, comparador)
	end
}

-- Metatable de Catalogo
local Catalogo_metatable = {
	__index = Catalogo_methods
}

-- Construtor
Catalogo = function()
	self = {}
	self.livros = {}
	setmetatable(self, Catalogo_metatable)
	return self
end

-- Função auxiliar de ordenação
function quicksort(lista, inic, fim, comparador)
	-- Critério de parada
	if not (inic < fim) then
		return
	end
	
	-- Partição
	pivo = lista[inic]
	p = inic
	
	for i = inic+1, fim do
		if comparador(pivo, lista[i]) then
			lista[p] = lista[i]
			lista[i] = lista[p+1]
			lista[p+1] = pivo
			p = p+1
		end
	end
	
	-- Chamada recursiva
	quicksort(lista, inic, p-1, comparador)
	quicksort(lista, p+1, fim, comparador)
end

