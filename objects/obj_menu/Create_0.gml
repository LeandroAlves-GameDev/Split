/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando uma lista de arrays com string
lista_letras = ["S", "P", "L", "I", "T"]

//Criando um timer de deslocamento da letra 
tempo_letra = 0;

desenha_menu = function()
{
    //Criando uma lista para cores das letra
    var _cores = [c_red, c_orange, c_yellow, c_green, c_purple];
    
    draw_set_halign(fa_middle);
    draw_set_valign(fa_center);
    
    draw_set_font(fnt_menu);
    
    //Fazendo nosso metodo de desenhar o titulo
    //criando nosso for
    for (var i = 0; i < array_length(lista_letras); i++) 
    {
        //informando a cor que eu quero
        var _cor_atual = _cores[i];
        
        var _x = (array_length(lista_letras) * 50) / 3;
        //explicando o conceito do calculo
        //ele vai pegar meu a quantidade de entrada de arrays ou seja o total que tenho
        //vai multiplicar esse valor por 50 e depois vai dividar por 3
        //com isso teremos o resultado do calculo
        
        var _y = sin(tempo_letra + (i * 0.5)) * 20;
        var pos_y = y + _y
        //informando o calculo da posição x, ele vai pegar o meu x da room e subtrair com o resultado do valor
        //de _x e vai somar esse valor com o resultado do i ou seja indice multiplicado por 50
        //dando o valor do pos_x
        var pos_x = (x - _x) + (i * 50)
    	//rodando meu for por padrão o indice e igual a zero
        //porém se meu indice for menor que minha letra então ele aumenta meu indice em um
        squiggle_draw_text_transformed_colour(pos_x, pos_y + 2, lista_letras[i], 2.5, 2.5, 0, c_black, c_black,
            c_black, c_black, 1)
        
        draw_set_color(_cor_atual);
        squiggle_draw_text_transformed(pos_x, pos_y, lista_letras[i], 2.5, 2.5, 0)
    }
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
}

//metodo de timer da onda
atualiza_timer_onda = function()
{
    //fazendo eu ganhar valores
    tempo_letra += 0.05; 
    
    //show_debug_message(tempo_letra)
    //mensagem pra debug
    
    //quando meu timer atingir esse valor 6.28
    if (tempo_letra >= 6.28318)
    {
        
        //ele reseta para 0 garantido um limite
        tempo_letra = 0;
    }
}