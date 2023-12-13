LARGURA_TELA, ALTURA_TELA = love.graphics.getDimensions()

function love.load()
    Classe = require "classes/classic"
    require "classes/dino"
    require "cenas/jogo"
    require "conf"
    require "classes/fundo"
    require "classes/meteoro"
    Jogo = Jogo()
 end
 
function love.update(dt)
   Jogo:update(dt)
 end
 
function love.draw()
   Jogo:draw()
end