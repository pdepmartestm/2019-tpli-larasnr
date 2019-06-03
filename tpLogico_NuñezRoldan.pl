%familia de sangre
hijo_de(lara,anibal).
hijo_de(lara,silvia).
hijo_de(carola,anibal).
hijo_de(carola,silvia).
hijo_de(anibal,cinthia).
hijo_de(anibal,hernan).
hijo_de(cesar,cinthia).
hijo_de(cesar,hernan).
hijo_de(lautaro,cinthia).
hijo_de(lautaro,hernan).
hijo_de(silvia,nelly).
hijo_de(silvia,pablo).
hijo_de(viviana,nelly).
hijo_de(viviana,pablo).
hijo_de(delfina,viviana).
hijo_de(santiago,viviana).
hijo_de(zara,cesar).
hijo_de(augusto,lautaro).

%familia no emparentada
hijo_de(facundo,silvia).
hijo_de(ana,anibal).
hijo_de(delfina,daniel).
hijo_de(santiago,daniel).
hijo_de(zara,susana).
hijo_de(augusto,isabel).

    %para no usar muchas reglas en hermanastros/padrastro/madrastra
no_de_sangre(ana).
no_de_sangre(facundo).

no_de_sangre(daniel).
no_de_sangre(susana).
no_de_sangre(isabel).

%sexo
es_mujer(silvia).
es_mujer(lara).
es_mujer(carola).
es_mujer(cinthia).
es_mujer(nelly).
es_mujer(viviana).
es_mujer(susana).
es_mujer(zara).
es_mujer(isabel).
es_mujer(delfina).
es_mujer(ana).

es_hombre(anibal).
es_hombre(cesar).
es_hombre(hernan).
es_hombre(lautaro).
es_hombre(pablo).
es_hombre(daniel).
es_hombre(facundo).
es_hombre(augusto).
es_hombre(santiago).

%reglas
      %para familia de sangre
padre(Padre,Hijo):- hijo_de(Hijo,Padre),
    es_hombre(Padre),
    Hijo\= ana,
    Hijo\= facundo.
madre(Madre,Hijo):- hijo_de(Hijo,Madre),
    es_mujer(Madre),
    Hijo\= ana,
    Hijo\= facundo.
hermanos(Hermano1,Hermano2):- padre(Padre,Hermano1),
    padre(Padre,Hermano2),
    madre(Madre,Hermano1),
    madre(Madre,Hermano2),Hermano1\=Hermano2.

tio(Tio,Sobrino):- hijo_de(Sobrino,Hermano_tio),
    hermanos(Hermano_tio,Tio),
    es_hombre(Tio),
    Sobrino\= ana,
    Sobrino\= facundo.
tia(Tia,Sobrino):- hijo_de(Sobrino,Hermano_tia),
    hermanos(Hermano_tia,Tia),
    es_mujer(Tia),
    Sobrino\= ana,
    Sobrino\= facundo.

      %para familia no emparentada
hermanastros(Hermano1,Hermano2):-hijo_de(Hermano1,PadreOmadre),
    hijo_de(Hermano2,PadreOmadre),
    no_de_sangre(Hermano1),
    Hermano1\=Hermano2.
hermanastros(Hermano1,Hermano2):-hijo_de(Hermano1,PadreOmadre),
    hijo_de(Hermano2,PadreOmadre),
    no_de_sangre(Hermano2),
    Hermano1\=Hermano2.

padrastro(Padrastro,Hijastro):-hijo_de(Hijastro,Padrastro),
    es_hombre(Padrastro),
    no_de_sangre(Hijastro).
madrastra(Madrastra,Hijastro):-hijo_de(Hijastro,Madrastra),
    es_mujer(Madrastra),
    no_de_sangre(Hijastro).

tio_politico(TioP,Sobrino_a):- hijo_de(Primo_a,TioP),
    tia(Tia,Sobrino_a),
    hijo_de(Primo_a,Tia),
    es_hombre(TioP).
tia_politica(TiaP,Sobrino_a):- hijo_de(Primo_a,TiaP),
    tio(Tio,Sobrino_a),
    hijo_de(Primo_a,Tio),
    es_mujer(TiaP).

      %para los dos casos, estén o no emparentados
abuelo(Abuelo,Nieto):- hijo_de(PadreOMadre,Abuelo),
    hijo_de(Nieto,PadreOMadre),
    es_hombre(Abuelo).
abuela(Abuela,Nieto):- hijo_de(PadreOMadre,Abuela),
    hijo_de(Nieto,PadreOMadre),
    es_mujer(Abuela).
primos(Primo1,Primo2):-hijo_de(Primo1,PadreOMadre_primo1),
    hijo_de(Primo2,PadreOMadre_primo2),
    hermanos(PadreOMadre_primo1,PadreOMadre_primo2).



