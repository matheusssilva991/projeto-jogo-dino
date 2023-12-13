Meteoro = Classe:extend()
math.randomseed(os.time())

function Meteoro:new(limite_esquerdo_x, limite_direito_x)
    self.img = love.graphics.newImage("/recursos/imagem/cenario/meteor.png")
    self.largura = self.img:getWidth() * 2
    self.altura = self.img:getHeight() * 2
    self.x = love.math.random(limite_esquerdo_x, limite_direito_x - 24)
    self.y = 0
end

function Meteoro:update(dt)
    self.y = self.y + (520 * dt)
end

function Meteoro:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, 2, 2)
    -- love.graphics.rectangle("line", self.x, self.y, self.largura, self.altura)
end

function Sorte_meteoro(Lista_meteoros, limite_esquerdo_x, limite_direito_x)
    Sorte = love.math.random(0, 1)
       if Sorte == 1 then
          local Meteoro = Meteoro(limite_esquerdo_x, limite_direito_x)
          table.insert(Lista_meteoros, Meteoro)
       end
 end

function AtualizaMeteoro(Lista_meteoros, Dino, dt)
    for i, meteoro in pairs(Lista_meteoros) do
       meteoro:update(dt)

       if VerificaColisao(Dino, meteoro) then
             Dino.pontuacao = Dino.pontuacao - 50
             table.remove(Lista_meteoros, i)
       end

       if meteoro.y > ALTURA_TELA then
          table.remove(Lista_meteoros, i)
       end
    end
end

function DesenhaMeteoro(Lista_meteoros)
    for i, meteoro in pairs(Lista_meteoros) do
       meteoro:draw()
    end
end