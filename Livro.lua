-------------------------------------------------------
-- Classe Livro
-- Autor: Jeferson Batista
-------------------------------------------------------

-- Métodos
local Livro_methods = {
	Print = function(self)
		print("Código: " .. self.codigo)
		print("Título: " .. self.titulo)
		print("Autor: " .. self.autor)
		print()
	end,
	
	setTitulo = function(self, titulo)
		self.titulo = titulo
	end,
	
	setAutor = function(self, autor)
		self.autor = autor
	end
}

-- Metatable de Livro
local Livro_metatable = {
	__index = Livro_methods
}

-- Construtor
Livro = function(codigo)
	self = {}
	self.codigo = codigo
	setmetatable(self, Livro_metatable)
	return self
end

cmpCodigoCresc = function(livro, outro)
	return livro.codigo > outro.codigo
end

cmpCodigoDecresc = function(livro, outro)
	return not cmpCodigoCresc(livro, outro)
end

cmpTitulo = function(livro, outro)
	if livro.titulo < outro.titulo then
		return true
	else 
		if livro.titulo > outro.titulo then
			return false
		else
			return cmpCodigoDecresc(livro, outro)
		end
	end
end

cmpAutor = function(livro, outro)
	if livro.autor > outro.autor then
		return true
	else 
		if livro.autor < outro.autor then
			return false
		else
			return cmpCodigoCresc(livro, outro)
		end
	end
end


