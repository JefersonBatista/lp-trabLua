-------------------------------------------------------
-- Classe Catalogo
-- Autor: Jeferson Batista
-------------------------------------------------------

dofile("Livro.lua")

-- Métodos
local Catalogo_methods {
	function Print(self)
		catalogo = self.livros
		for i = 1, #catalogo do
			catalogo[i]:Print()
		end
	end,
	
	function add(self, livro)
		catalogo = self.livros
		table.insert(catalogo, livro)
	end,
	
	-- Função principal de ordenação
	function sort(self, comparator)
		catalogo = self.livros
		quicksort(catalogo, comparator)
	end
}

-- Metatable de Catalogo
local Catalogo_metatable = {
	__index = Catalogo_methods
}

-- Construtor
function Catalogo()
	self = {}
	self.livros = {}
	setmetatable(self, Catalogo_metatable)
	return self
end

-- Função auxiliar de ordenação
function quicksort(lista, comparator)
	if lista == {} then
		return
	end
		
	n = #lista
	pivo = lista[1]
	menores = {}
	maiores = {}
	
	for i = 2, n do
		if comparator(pivo, lista[i]) then
			table.insert(menores, lista[i])
		else
			table.insert(maiores, lista[i])
		end
	end
	
	quicksort(menores, comparator)
	table.insert(menores, pivo)
	quicksort(maiores, comparator)
	lista = concatenar(menores, maiores)
end

-- Função de concatenação de listas
function concatenar(lista, outra)
	n = #outra
	for i = 1, n do
		table.insert(lista, outra[i])
	end
	return lista
end


