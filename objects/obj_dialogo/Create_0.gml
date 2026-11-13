/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Criando nosso sistema de dialogos do Split
//criando um array list usando struct
lista_frases = [
    { texto: "Olá! Vamos treinar matemática?", tipo: "fala" },
    { texto: "Quanto é 5 + 3?", tipo: "pergunta", opcoes: [6, 8, 10], resposta_correta: 8 },
    { texto: "Excelente! Próxima: quanto é 10 - 4?", tipo: "pergunta", opcoes: [4, 6, 7], resposta_correta: 6 },
    { texto: "Boa! Quanto é 4 x 3?", tipo: "pergunta", opcoes: [10, 12, 14], resposta_correta: 12 },
    { texto: "Mandou bem! E quanto é 20 / 4?", tipo: "pergunta", opcoes: [4, 5, 6], resposta_correta: 5 },
    { texto: "Você venceu o desafio!", tipo: "fala" },
    { texto: "Jogo encerrado", tipo: "fala"}
];
//dentro dessa struct teremos tres "variaveis" texto: O que vai aparecer escrito na caixa de diálogo.
//tipo: Define a "regra" daquele momento (se é só uma fala que exige um botão 
//"Avançar", ou se é uma pergunta que exige que o jogador escolha um número).
//resposta_correta: Só existe nos tipos "pergunta" e serve para o jogo saber qual é o gabarito.

//criando nossa variavel de indice
indice_frase = 0;
texto_atual = "";


//Criando uma nova lista de arrays informandos os objetos que tenho
lista_botao = [obj_botao_resposta_1, obj_botao_resposta_2, obj_botao_resposta_3];

//Criando o metodo de gerar o texto da caixa de dialogo
gera_dialogo = function()
{
    //O que isso faz? 
    //meu texto_atual vai pegar lista frases ou seja o array que montei
    //dentro dele nos colchetes ele vai olhar para dentro da lista que se refere
    //ao meu indice_frase
    var _frase_atual = lista_frases[indice_frase];
    //o .texto ele apenas pede para pegar a informação que tem de texto
    texto_atual = _frase_atual.texto;
    if (_frase_atual.tipo == "pergunta")
    {
        ////mensagem de debug
        //show_debug_message("É uma pergunta! Opções disponíveis.");
    }
}

//Criando um novo metodo para avançar o dialogo
avanca_dialogo = function()
{
    
    indice_frase += 1;
    //fazendo meu indice subir mais um numero
    //rodando o if para dar andamento no dialogo
    if(indice_frase < array_length(lista_frases))
    {
        //chamando meu metodo de texto
        //se o valor do indice e menor que a quantidade de string do array
        //então ele continua rodando o metodo gera dialogo
        gera_dialogo();
        var _frase_atual = lista_frases[indice_frase];
        //Criando meu botão de resposta
        if(_frase_atual.tipo == "pergunta")
        {
            //verificando se a instancia existe, se existe, então eu destruo ela
            if (instance_exists(obj_botao_resposta_1)) instance_destroy(obj_botao_resposta_1); 
            if (instance_exists(obj_botao_resposta_2)) instance_destroy(obj_botao_resposta_2); 
            if (instance_exists(obj_botao_resposta_3)) instance_destroy(obj_botao_resposta_3);
            
            var _limite_botoes = min(array_length(lista_botao), 3);
            //criando um for para recriar o botão varias vezes
            for (var i = 0; i < _limite_botoes; i++) 
            {
            	//definindo a posição x do meu objeto
                var _x = (array_length(lista_botao) / 3);
                var pos_x = (x - _x) + (i * 90)
                
                //definindo o y do objeto
                var _y = 170;
                //se meu indice for maior que zero
                //ele cria o botão
                criabotao = instance_create_layer(pos_x, _y, "botao", lista_botao[i])
                criabotao.texto = string(_frase_atual.opcoes[i]);
            }
        }
    }
    else
    {
        //se acabou minha lista então eu volto pro menu
        room_goto(rm_menu);
    }
}


//criando o metodo de desenhar dialogo
desernha_dialogo = function()
{
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_set_font(fnt_perguntas)
    
    var centro_x = x + (sprite_width / 2);
    var centro_y = y + (sprite_height / 2);
    
    //desenhando nosso texto na tela
    squiggle_draw_text_ext_transformed_colour(centro_x, centro_y, texto_atual, 30, 400, 1, 1, 0, c_black, c_black, c_black, c_black, 1)
    
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(-1)
}


//Criando o desenho da sombra do dialogo
desenha_sombra_dialogo = function()
{
     draw_sprite_ext(spr_dialogo_sombra, 0, x, y + 2, image_xscale, image_yscale, 0, c_white, .5)
}


avanca_dialogo()