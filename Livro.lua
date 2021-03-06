-------------------------------------------------------
-- Classe Livro
-- Autor: Jeferson Batista
-------------------------------------------------------

dofile("Data.lua")

-- Métodos
local Livro_methods = {
	escrever = function(self)
		io.write(self.codigo, "\n")
		io.write(self.titulo, "\n")
		io.write(self.autor, "\n")
		io.write(self.assunto, "\n")
		self.data:escrever()
		io.write(self.editora, "\n")
		io.write(self.resumo, "\n")
	end,
	
	getCodigo = function(self)
		return self.codigo
	end,
	
	setTitulo = function(self, titulo)
		self.titulo = titulo
	end,
	
	setAutor = function(self, autor)
		self.autor = autor
	end,
	
	setAssunto = function(self, assunto)
		self.assunto = assunto
	end,
	
	setData = function(self, data)
		self.data = data
	end,
	
	setEditora = function(self, editora)
		self.editora = editora
	end,
	
	setResumo = function(self, resumo)
		self.resumo = resumo
	end
}

-- Metatable de Livro
local Livro_metatable = {
	__index = Livro_methods
}

-- Construtor
Livro = function(codigo, titulo, autor, assunto, data, editora, resumo)
	self = {}
	self.codigo = codigo
	self.titulo = titulo
	self.autor = autor
	self.assunto = assunto
	self.data = data
	self.editora = editora
	self.resumo = resumo
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
	t1 = string.lower(livro.titulo)
	t2 = string.lower(outro.titulo)

	if t1 < t2 then
		return true
	elseif t1 > t2 then
		return false
	else
		return cmpCodigoDecresc(livro, outro)
	end
end

cmpAutor = function(livro, outro)
	a1 = string.lower(livro.autor)
	a2 = string.lower(outro.autor)

	if a1 > a2 then
		return true
	elseif a1 < a2 then
		return false
	else
		return cmpCodigoCresc(livro, outro)
	end
end

cmpData = function(livro, outro)
	cmp = comparaData(livro.data, outro.data)
	if cmp == 1 then
		return false
	elseif cmp == -1 then
		return true
	else
		return cmpCodigoDecresc(livro, outro)
	end
end


