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
Blockgo4 = 0
Blockgo5 = 0
Block = {}
Block[1] = { x = 400, y = 80, height = block:height(), width = block:width() }
Block[2] = { x = 200, y = 30, height = block:height(), width = block:width() }
Block[3] = { x = 100, y = 200, height = block:height(), width = block:width() }
Block[4] = { x = 300, y = 100, height = block:height(), width = block:width() }
Block[5] = { x = 150, y = 150, height = block:height(), width = block:width() }
function movePlayer()
	pad = Controls.read()
	if pad:left() then
             if Player.x >= 1 then
		Player.x = Player.x - 5
       end
	end
	if pad:right() then
       if Player.x <= 448 then
		Player.x = Player.x + 5
       end
	end
	if pad:up() then
       if Player.y >= 0 then
		Player.y = Player.y - 5
       end
	end
	if pad:down() then
       if Player.y < 240 then
		Player.y = Player.y + 5
       end
	end
	if pad:down() then
       if Player.y > 240 then
		Player.y = Player.y - 5
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
       dofile("./script7.lua")
       end

       if Blockgo1 == 0 then
       Block[3].x = Block[3].x - 10
       if Block[3].x == 0 then
       Blockgo1 = 1
       end
       else
       Block[3].x= Block[3].x + 10
       if Block[3].x > 448 then
       Blockgo1 = 0
       end
       end



       if Blockgo5 == 0 then
       Block[5].x = Block[5].x - 10
       if Block[5].x == 0 then
       Blockgo5 = 5
       end
       else
       Block[5].x= Block[5].x + 10
       if Block[5].x > 448 then
       Blockgo5 = 0
       end
       end

       if Blockgo4 == 0 then
       Block[4].y = Block[4].y - 10
       if Block[4].y== 0 then
       Blockgo4 = 1
       end
       else
       Block[4].y = Block[4].y + 10
       if Block[4].y > 240 then
       Blockgo4 = 0
       end
       end
       if Blockgo2 == 0 then
       Block[2].y = Block[2].y - 10
       if Block[2].y == 0 then
       Blockgo2 = 1
       end
       else
       Block[2].y = Block[2].y + 10
       if Block[2].y > 240 then
       Blockgo2 = 0
       end
       end
       if Blockgo3 == 0 then
       Block[1].y = Block[1].y - 10
       if Block[1].y == 0 then
       Blockgo3 = 1
       end
       else
       Block[1].y = Block[1].y + 10
       if Block[1].y > 240 then
       Blockgo3 = 0
       end
       end
      
       if hp[1] < 1 then
       dead()
       dofile("./script6.lua")
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
	collisionCheck(Block[4])
	collisionCheck(Block[5])
	--paste player to screen
	screen:blit(Player.x,Player.y,player)

	--paste all 3 blocks to screen
	for a = 1,5 do
		screen:blit(Block[a].x,Block[a].y,block)
	end

	screen.waitVblankStart()
	screen.flip()
end





