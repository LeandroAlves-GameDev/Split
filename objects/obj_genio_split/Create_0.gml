/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Criando um timer de deslocamento da letra 
tempo_letra = 0;

//desenhando minha sprite de sombra
desenha_genio = function()
{
    var _y = y + sin(tempo_letra) * 12;
    //rodando o seguinte calculo sin retorna um valor em radianos
    //fazendo o calculo: tempo_letra vai ser multiplicado por 12 que dará o resultado de _y
    
    //desenhando a sombra do objeto
    draw_sprite_ext(spr_genio_sombra, 0, x, _y + 2, image_xscale, image_yscale, 0, c_white, .5)
    
    draw_sprite_ext(sprite_index, 0, x, _y, image_xscale, image_yscale, 0, c_white, 1)
}

//Criando nossa caixa de dialogo
cria_dialogo = function()
{
    //deixando a caixa de dialogo ao lado do genio
    var _x = sprite_get_width(sprite_index) / 2 + 50;
    var pos_x = x + _x
    
    var _y = 90;
    var pos_y = y + _y;
    
    cria_dialogo_caixa = instance_create_layer(pos_x, pos_y, "jogo", obj_dialogo);
}

//aplicando o efeito do squiggle e da flutuação na caixa de dialogo conforme o genio
efeito_caixa_dialogo = function()
{
    if(instance_exists(cria_dialogo_caixa))
    {
        var y_flutuar = y + sin(tempo_letra) * 12;
        cria_dialogo_caixa.y = y_flutuar + 90;
    }
}


//Criando nosso metodo de timer no genio
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

cria_dialogo();