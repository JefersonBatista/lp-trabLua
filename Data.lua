-------------------------------------------------------
-- Classe Data
-- Autor: Jeferson Batista
-------------------------------------------------------

-- Métodos
local Data_methods = {
	escrever = function(self)
		io.write(string.format("%.2d/%.2d/%d\n", self.dia, self.mes, self.ano))
	end
}

-- Metatable de Livro
local Data_metatable = {
	__index = Data_methods
}

-- Construtor
Data = function(dataStr)
	self = {}
	self.dia = tonumber(string.sub(dataStr, 1, 2)) or 0
	self.mes = tonumber(string.sub(dataStr, 4, 5)) or 0
	self.ano = tonumber(string.sub(dataStr, 7, 10)) or 0
	setmetatable(self, Data_metatable)
	return self
end

comparaData = function(data, outra)
	if data.ano > outra.ano then
		return 1
	elseif data.ano < outra.ano then
		return -1
	elseif data.mes > outra.mes then
		return 1
	elseif data.mes < outra.mes then
		return -1
	elseif data.dia > outra.dia then
		return 1
	elseif data.dia < outra.dia then
		return -1
	else
		return 0
	end
end


