import UIKit

struct ObraDeArte {
    var titulo: String
    var artista: String
    var ano: Int
    var estilo: String
    var imagemNome: String
    var descricao: String
}

let obras: [ObraDeArte] = [
    ObraDeArte(titulo: "Pindorama", artista: "Rimon Guimaraes", ano: 2020, estilo: "Tinta fotocatalítica", imagemNome: "pindorama", descricao: "A empena “Pindorama” feita pelo artista Rimon Guimarães tem 777 metros quadrados e está localizada no Largo do Arouche em São Paulo. Segundo o artista: “Esse nome remete ao Brasil antes da colonização, a onça simboliza a terra em q vivemos a consciência ambiental e a força, seu rabo é uma serpente trazendo o simbolismo do sub mundo, o subterrâneo, o que não vemos, o pássaro simboliza o ar, sendo um mensageiro do mundo material pro imaterial, a planta traz a ideia do processo da tinta de filtragem do ar que é parecido com a fotossíntese, a personagem foi inspirada na vestimenta feminina dos “Jurupixunas” e das pinturas faciais dos povos “Xicrins” e “Kayapós” . Esse mural foi pintado com uma tinta fotocatalítica que filtra o ar equivalente a mais ou menos 750 árvores, ele faz parte de uma ação global da Converse chamada #conversecityforests com 13 murais espalhados em 13 capitais no mundo.”"),
    ObraDeArte(titulo: "Jogadores no bar", artista: "Poty Lazzarotto", ano: 1991, estilo: "Gravura", imagemNome: "jogadoresnobar", descricao: "Litogravura sobre papel de 36 x 29 cm doada pela familia de Lazzarotto ao Museu Oscar Niemeyer."),
    ObraDeArte(titulo: "Presépio na lata", artista: "Helio Leites", ano: 2010, estilo: "Arte postal", imagemNome: "lata", descricao: "O artista paranaense Hélio Leite é um figura que vive em outro mundo e cria para nós viventes deste universo conturbado puros delírios e fantasias em miniaturas. Todas com material reaproveitável, ou seja que antes eram apenas lixo reciclável.  Isto é, Hélio Leite com a artista Efigênia Rolim são significadores do insignificante. Maravilhosas obras que nos fazem viajar na fantasia. Esta, especialmente, criada em 2010 é lata (metal), madeira, tinta acrílica e fio de cabelo do artista.")
]
