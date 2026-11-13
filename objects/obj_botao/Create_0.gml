/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//chamando meu metodo de mola
inicia_efeito_mola();

texto = "Jogar";

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
        //se eu apertei o botão do mouse, logo então eu vou pra room fase
        room_goto(rm_fase)
    }
}

//Criando nosso metodo de desenhar o menu
desenha_botao = function()
{
    
    var escala_x = xscale * 1;
    var escala_y = yscale * 1;
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    
    //informando a fonte que será usada
    draw_set_font(fnt_menu);
    //Escrevendo nosso texto no botão
    //usando o draw_text_transformed_colour para podermos mudar a cor do texto
    squiggle_draw_text_transformed_colour(x + 1, y + 1, texto, escala_x, escala_y, 0, 
        c_black, c_black, c_black, c_black, .3);
    //criando o texto que será nossa sombra
    squiggle_draw_text_transformed_colour(x, y, texto, escala_x, escala_y, 0, c_white, c_white, c_white, c_white, 1);
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
    draw_sprite_ext(spr_botao_grande_sombra, 0, x, y, escala_x, escala_y, 0, c_white, .2)
}