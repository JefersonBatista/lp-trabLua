-------------------------------------------------------
-- Main
-- Autor: Jeferson Batista
-------------------------------------------------------

dofile("Catalogo.lua")

bib = Catalogo()
bib:ler()
bib:atualizar()

arquivo = io.open("saida.txt", "w")
io.output(arquivo)

io.write("Lista de Livros Ordenada Crescentemente por Codigo:\n\n")
bib:ordenar(cmpCodigoCresc)
bib:escrever()

io.write("Lista de Livros Ordenada Decrescentemente por Titulo:\n\n")
bib:ordenar(cmpTitulo)
bib:escrever()

io.write("Lista de Livros Ordenada Crescentemente por Autor:\n\n")
bib:ordenar(cmpAutor)
bib:escrever()

io.write("Lista de Livros Ordenada Decrescentemente por Data de Publicacao:\n\n")
bib:ordenar(cmpData)
bib:escrever()

io.close(arquivo)

arquivo = io.open("catalogo.txt", "w")
io.output(arquivo)

bib:ordenar(cmpCodigoCresc)
bib:escrever()

io.close(arquivo)

