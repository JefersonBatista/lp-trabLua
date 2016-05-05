dofile("Catalogo.lua")

livro1 = Livro(144, "Como programar em Lua", "Jeferson Batista")
livro2 = Livro(233, "O Senhor dos Anéis", "J. R. R. Tolkien")
livro3 = Livro(150, "E o vento levou", "Desconhecido")
livro4 = Livro(250, "ChuHaskell", "Jeferson Batista")
livro5 = Livro(458, "Como programar em Lua", "Flávio Varejão")
livro6 = Livro(222, "Vivendo Perigosamente", "Jeferson Batista")

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


