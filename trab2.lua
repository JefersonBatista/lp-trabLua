dofile("Catalogo.lua")

livro1 = Livro(144)
livro1:setTitulo("Como programar em Lua")
livro1:setAutor("Jeferson Batista")

livro2 = Livro(233)
livro2:setTitulo("O Senhor dos Anéis")
livro2:setAutor("J. R. R. Tolkien")

livro3 = Livro(150)
livro3:setTitulo("E o vento levou")
livro3:setAutor("Desconhecido")

livro4 = Livro(250)
livro4:setTitulo("ChuHaskell")
livro4:setAutor( "Jeferson Batista")

livro5 = Livro(458)
livro5:setTitulo("Como programar em Lua")
livro5:setAutor("Flávio Varejão")

livro6 = Livro(222)
livro6:setTitulo("Vivendo Perigosamente")
livro6:setAutor("Jeferson Batista")

bib = Catalogo()
bib:add(livro1)
bib:add(livro2)
bib:add(livro3)
bib:add(livro4)
bib:add(livro5)
bib:add(livro6)

print("Lista de Livros Ordenada Crescentemente por Codigo:\n")
bib:sort(cmpCodigoCresc)
bib:Print()

print("Lista de Livros Ordenada Decrescentemente por Titulo:\n")
bib:sort(cmpTitulo)
bib:Print()

print("Lista de Livros Ordenada Crescentemente por Autor:\n")
bib:sort(cmpAutor)
bib:Print()


