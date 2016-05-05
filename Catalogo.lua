-------------------------------------------------------
-- Classe Catalogo
-- Autor: Jeferson Batista
-------------------------------------------------------

dofile("Livro.lua")

-- Métodos
local Catalogo_methods = {
	Print = function(self)
		catalogo = self.livros
		for i = 1, #catalogo do
			catalogo[i]:Print()
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
			lista[p] = lista[i];
			lista[i] = lista[p+1];
			lista[p+1] = pivo;
			p = p+1;
		end
	end
	
	-- Chamada recursiva
	quicksort(lista, inic, p-1, comparador)
	quicksort(lista, p+1, fim, comparador)
end

-- Função de concatenação de listas
concatenar = function(lista, outra)
	for i = 1, #outra do
		table.insert(lista, outra[i])
	end
end


