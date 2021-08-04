white = Color.new(255,255,255)
red = Color.new(255,0,0)
ho = Color.new(192,192,192)
function dead()
       screen:print(150,120,"You are Dead.",red)
end
while true do
screen:clear()
pad = Controls.read()
screen:print(152,52,"Xiaoan Hide Box Game",ho)
screen:print(150,50,"Xiaoan Hide Box Game",white)
screen:print(202,102,"Level 9",ho)
screen:print(200,100,"Level 9",white)
screen:print(150,136,"Press 'X' Start Game ",white)
if pad:cross() then
dofile("./map9.lua")
end
	screen.waitVblankStart()
	screen.flip()
end







