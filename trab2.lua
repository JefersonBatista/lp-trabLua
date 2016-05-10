-------------------------------------------------------
-- Main
-- Autor: Jeferson Batista
-------------------------------------------------------

dofile("Catalogo.lua")

bib = Catalogo()
bib:ler()

arquivo = io.open("saida.txt", "w")

arquivo:write("Lista de Livros Ordenada Crescentemente por Codigo:\n\n")
bib:sort(cmpCodigoCresc)
arquivo:write(bib:registrar())

arquivo:write("Lista de Livros Ordenada Decrescentemente por Titulo:\n\n")
bib:sort(cmpTitulo)
arquivo:write(bib:registrar())

arquivo:write("Lista de Livros Ordenada Crescentemente por Autor:\n\n")
bib:sort(cmpAutor)
arquivo:write(bib:registrar())

arquivo:write("Lista de Livros Ordenada Decrescentemente por Data de Publicacao:\n\n")
bib:sort(cmpData)
arquivo:write(bib:registrar())

io.close(arquivo)


