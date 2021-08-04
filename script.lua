white = Color.new(255,255,255) 
red = Color.new(255,0,0) 
ho = Color.new(192,192,192) 
yellow = Color.new(255,255,0) 

while true do
screen:clear()
pad = Controls.read()
screen:print(152,52,"Xiaoan Hide Box Game",ho)
screen:print(150,50,"Xiaoan Hide Box Game",white)
screen:print(150,100,"'X' Start Game",red)
screen:print(150,120,"'O' Start Free Mode",yellow)
screen:print(150,140,"'[]' Read Help",yellow)
if pad:circle() then
dofile("./free.lua")
end
if pad:square() then
dofile("./help.lua")
end
if pad:cross() then
dofile("./start.lua")
end
	screen.waitVblankStart()
	screen.flip()
end

