-------------------------------------------------------
-- Main
-- Autor: Jeferson Batista
-------------------------------------------------------

dofile("Catalogo.lua")

bib = Catalogo()
bib:ler()

arquivo = io.open("saida.txt", "w")
io.output(arquivo)

io.write("Lista de Livros Ordenada Crescentemente por Codigo:\n\n")
bib:sort(cmpCodigoCresc)
bib:escrever()

io.write("Lista de Livros Ordenada Decrescentemente por Titulo:\n\n")
bib:sort(cmpTitulo)
bib:escrever()

io.write("Lista de Livros Ordenada Crescentemente por Autor:\n\n")
bib:sort(cmpAutor)
bib:escrever()

io.write("Lista de Livros Ordenada Decrescentemente por Data de Publicacao:\n\n")
bib:sort(cmpData)
bib:escrever()

io.close(arquivo)


