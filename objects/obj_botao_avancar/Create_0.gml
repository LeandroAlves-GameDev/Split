/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

//fazendo nosso botão avançar ser filho do botão original 
texto = "Avançar";

//Criando o metodo para ver se estou tocando no botão (la ele) com o mouse
funciona_menu = function()
{
    var _mouse_acima = position_meeting(mouse_x, mouse_y, id);
    var _click_mouse = mouse_check_button_pressed(mb_left);
    
    if(_mouse_acima) 
    {
        efeito_mola(1.2, 1.2);
    }  
    //rodando o if do click do mouse
    if(_click_mouse && _mouse_acima)
    {
        //toda vez que eu clico no botão ele roda o som
        audio_play_sound(beep, 1, 0);
        //se meu click do mouse e meu mouse estiver acima do botão da resposta
        var _frase_atual = obj_dialogo.lista_frases[obj_dialogo.indice_frase];
        //então ele chamará meu obj_dialogo e a variavel lista_frases, dentro dessa chamada ele
        //vai informar o indice_frase que quero
        if (_frase_atual.tipo != "pergunta")
        {
            //se meu if _frase_atual for diferente ou igual a pergunta então ele passa para a proxima frase
            obj_dialogo.avanca_dialogo();
        }
    }
}


//Criando nosso metodo de desenhar o menu
desenha_botao = function()
{
    //Centralizando o texto no objeto botao
    var _x = x + ((sprite_width * xscale) / 2);
    var _y = y + ((sprite_height * yscale) / 2);
    //ele vai fazer o seguinte calculo minha largura da minha sprite multiplicado pelo meu xscale 
    //divido por 2 e somado ao x da room
    //o mesmo e aplicado para o y
    //com isso dando o resultado das variaveis _x e _y
    
    //informando a escala que ele deve ficar
    var escala_x = xscale;
    var escala_y = yscale;
    
    //centralizando o texto no centro e no meio 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    //informando a fonte que será usada
    draw_set_font(fnt_perguntas);
    //Escrevendo nosso texto no botão
    //usando o draw_text_transformed_colour para podermos mudar a cor do texto
    squiggle_draw_text_transformed_colour(_x + 1, _y + 1, texto, escala_x, escala_y, 0, 
        c_black, c_black, c_black, c_black, .3);
    //criando o texto que será nossa sombra
    squiggle_draw_text_transformed_colour(_x, _y, texto, escala_x, escala_y, 0, c_black, c_black, c_black, c_black, 1);
    //criando o texto principal
    //resetando para a posição original
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
} 

//desenhando minha sprite de sombra
desenha_sombra = function()
{
    var escala_x = xscale * 1;
    var escala_y = yscale * 1;
    
    //desenhando a sombra do objeto
    draw_sprite_ext(spr_botao_pequeno_sombra, 0, x + 1, y + 1, escala_x, escala_y, 0, c_white, .2)
}