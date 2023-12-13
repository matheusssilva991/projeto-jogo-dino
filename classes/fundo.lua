Fundo = Classe:extend()

function Fundo:new() 
    self.imgs = {}

    for i=11, 1, -1 do
        local img = love.graphics.newImage("/recursos/imagem/cenario/background_layers/" .. "Layer_" .. i ..".png")
        table.insert(self.imgs, img)
    end 
end

function Fundo:update()
    
end

function Fundo:draw()
    for i=1, 11 do
        love.graphics.draw(self.imgs[i], 0, 0, 0, 0.9, 0.80)
    end 

    love.graphics.line(LARGURA_TELA/2, 0, LARGURA_TELA/2, ALTURA_TELA)
end