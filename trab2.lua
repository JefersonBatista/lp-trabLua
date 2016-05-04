dofile("Catalogo.lua")

livro1 = Livro.new(144, "Como programar em Lua", "Jeferson Batista")
livro2 = Livro.new(233, "O Senhor dos Anéis", "J. R. R. Tolkien")
livro3 = Livro.new(150, "E o vento levou", "Desconhecido")
livro4 = Livro.new(250, "ChuHaskell", "Jeferson Batista")
livro5 = Livro.new(458, "Como programar em Lua", "Flávio Varejão")
livro6 = Livro.new(222, "Vivendo Perigosamente", "Jeferson Batista")

bib = Catalogo.new()
bib:add(livro1)
bib:add(livro2)
bib:add(livro3)
bib:add(livro4)
bib:add(livro5)
bib:add(livro6)

bib:sort(cmpCodeCresc)
bib:Print()

bib:sort(cmpTitulo)
bib:Print()

bib:sort(cmpAutor)
bib:Print()


