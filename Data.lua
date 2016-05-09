-------------------------------------------------------
-- Classe Data
-- Autor: Jeferson Batista
-------------------------------------------------------

-- Métodos
local Data_methods = {
	strData = function(self)
		return '%.2d/%.2d/%d\n' % (self.dia, self.mes, self.ano)
	end
}

-- Metatable de Livro
local Data_metatable = {
	__index = Data_methods
}

-- Construtor
Data = function(dataStr) {
	self = {}
	self.dia = tonumber(string.sub(dataStr, 1,2))
	self.mes = tonumber(string.sub(dataStr, 4,5))
	self.ano = tonumber(string.sub(dataStr, 7, 10))
	setmetatable(self, Data_metatable)
	return self
}

comparaData = function(data, outra)
	if data.ano > outra.ano
		return 1
	elseif data.ano < outra.ano
		return -1
	elseif data.mes > outra.mes
		return 1
	elseif data.mes < outra.mes
		return -1
	elseif data.dia > outra.dia
		return 1
	elseif data.dia < outra.dia
		return -1
	else
		return 0
	end
end


