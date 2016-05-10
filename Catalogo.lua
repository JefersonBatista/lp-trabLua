-------------------------------------------------------
-- Classe Catalogo
-- Autor: Jeferson Batista
-------------------------------------------------------

dofile("Livro.lua")

-- Métodos
local Catalogo_methods = {
	ler = function(self)
		arquivo = io.open("catalogo.txt", "r")
		linha = arquivo:read()
		
		while linha ~= nil do
			codigo = tonumber(linha) or 0
			titulo = arquivo:read()
			autor = arquivo:read()
			assunto = arquivo:read()
			strData = arquivo:read()
			data = Data(strData)
			editora = arquivo:read()
			
			-- Montando o resumo
			resumo = ""
			linha = arquivo:read()
			while linha ~= "" and linha ~= nil do
				resumo = resumo .. linha
				linha = arquivo:read()
			end
			
			while linha == "" do
				linha = arquivo:read()
			end
		end
		
		livro = Livro(codigo)
		livro:setTitulo(titulo)
		livro:setAutor(autor)
		livro:setAssunto(assunto)
		livro:setData(data)
		livro:setEditora(editora)
		livro:setResumo(resumo)
		self:add(livro)
		
		io.close(arquivo)
	end, 
	
	registrar = function(self)
		registro = ""
		catalogo = self.livros
		for i = 1, #catalogo do
			print(i)
			-- print(catalogo[i]:strLivro())
			registro = registro .. catalogo[i]:strLivro()
		end
		-- print(registro)
		
		return registro
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

