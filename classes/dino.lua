Dino = Classe:extend()

function Dino:new(dino_file, limite_esquerdo_x, limite_direito_x, teclas_mover)
    self.img = love.graphics.newImage("/recursos/imagem/personagens/" .. dino_file .. ".png")
    self.largura = self.img:getWidth()
    self.altura = self.img:getHeight()
    self.x = limite_esquerdo_x + (limite_direito_x - limite_esquerdo_x) / 2
    self.y = ALTURA_TELA - 70
    self.quadros = {}
    self.limite_esquerdo_x = limite_esquerdo_x
    self.limite_direito_x = limite_direito_x
    self.teclas_mover = teclas_mover
    self.pontuacao = 1000

    local larguraQ = 24
    local alturaQ = 24

    for y = 0, self.altura - alturaQ, alturaQ do
        for x = 0, self.largura - larguraQ, larguraQ do
        local quadro = love.graphics.newQuad(x, y, larguraQ, alturaQ,self.largura, self.altura)
        
        table.insert(self.quadros, quadro)
        end
    end

    self.largura = 24 * 2.5
    self.altura = 24 *2.5
end

function Dino:update(dt)
    if love.keyboard.isDown(self.teclas_mover[1]) then
        if (self.x) >= self.limite_esquerdo_x then
            self.x = self.x - 500 * dt
        end
    elseif love.keyboard.isDown(self.teclas_mover[2]) then
        if (self.x + 15) <= self.limite_direito_x - 48 then
            self.x = self.x + 500 * dt
        end
    end
end

function Dino:draw()
    love.graphics.draw(self.img, self.quadros[1], self.x, self.y, 0, 2.5, 2.5)
    love.graphics.print("Pontuacao: " .. self.pontuacao, self.limite_esquerdo_x + 10, 10)
    -- love.graphics.rectangle("line", self.x, self.y, self.largura, self.altura)
end

math.randomseed(os.time())

function SorteaDino()
   local dinos = {"doux", "mort", "tard", "vita"}
   local dinos_sorteados = {}

   local numero_sorteado = (love.math.random(1, 4))
   table.insert(dinos_sorteados, dinos[numero_sorteado])
   table.remove(dinos, numero_sorteado)

   numero_sorteado = (love.math.random(1, 3))
   table.insert(dinos_sorteados, dinos[numero_sorteado])
   table.remove(dinos, numero_sorteado)

   return dinos_sorteados
end