hp = { 1 }
green=Color.new(0,255,0)
white = Color.new(255,255,255) 
red = Color.new(255, 0, 0)
player = Image.createEmpty(32,32)
player:clear(white)
block = Image.createEmpty(32,32)
block:clear(green) 
Player = { x = 30, y = 100 } 
playerHeight = 32
playerWidth = 32 
Blockgo1 = 0
Blockgo2 = 0
Blockgo3 = 0
Block = {}
Block[1] = { x = 400, y = 80, height = block:height(), width = block:width() }
Block[2] = { x = 300, y = 30, height = block:height(), width = block:width() }
Block[3] = { x = 200, y = 200, height = block:height(), width = block:width() }

function movePlayer()
	pad = Controls.read()
	if pad:left() then
             if Player.x >= 1 then
		Player.x = Player.x - 3
       end
	end
	if pad:right() then
       if Player.x <= 448 then
		Player.x = Player.x + 3
       end
	end
	if pad:up() then
       if Player.y >= 0 then
		Player.y = Player.y - 3
       end
	end
	if pad:down() then
       if Player.y < 240 then
		Player.y = Player.y + 3
       end
	end
	if pad:down() then
       if Player.y > 240 then
		Player.y = Player.y - 3
       end
	end
end 

function collisionCheck(object)
	if (Player.x + playerWidth > object.x) and (Player.x < object.x + object.width) and (Player.y + playerHeight > object.y) and (Player.y < object.y + object.height) then
		Player.x = oldx
		Player.y = oldy
          hp[1] = hp[1] - 1
	end
end 

while true do

       if Player.x > 448 then
       dofile("./script2.lua")
       end

       if Blockgo1 == 0 then
       Block[3].y = Block[3].y - 2
       if Block[3].y == 0 then
       Blockgo1 = 1
       end
       else
       Block[3].y = Block[3].y + 2
       if Block[3].y > 240 then
       Blockgo1 = 0
       end
       end
       if Blockgo2 == 0 then
       Block[2].y = Block[2].y - 2
       if Block[2].y == 0 then
       Blockgo2 = 1
       end
       else
       Block[2].y = Block[2].y + 2
       if Block[2].y > 240 then
       Blockgo2 = 0
       end
       end
       if Blockgo3 == 0 then
       Block[1].y = Block[1].y - 2
       if Block[1].y == 0 then
       Blockgo3 = 1
       end
       else
       Block[1].y = Block[1].y + 2
       if Block[1].y > 240 then
       Blockgo3 = 0
       end
       end
      
       if hp[1] < 1 then
       dead()
       dofile("./start.lua")
       end
 
       

	-- store player's position at beginning of each loop
	oldx = Player.x
	oldy = Player.y
	screen:clear()


	movePlayer()

	--check collision for each block
	collisionCheck(Block[1])
	collisionCheck(Block[2])
	collisionCheck(Block[3])

	--paste player to screen
	screen:blit(Player.x,Player.y,player)

	--paste all 3 blocks to screen
	for a = 1,3 do
		screen:blit(Block[a].x,Block[a].y,block)
	end

	screen.waitVblankStart()
	screen.flip()
end
