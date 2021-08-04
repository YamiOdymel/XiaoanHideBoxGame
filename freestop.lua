white = Color.new(255,255,255) 
red = Color.new(255,0,0) 
ho = Color.new(192,192,192) 
yellow = Color.new(255,255,0) 

while true do
screen:clear()
pad = Controls.read()
screen:print(122,52,"Xiaoan Hide Box Game Free Mode",ho)
screen:print(120,50,"Xiaoan Hide Box Game Free Mode",white)
screen:print(180,70,"You Lose.",red)
screen:print(140,100,"'X' Restart Free Mode",red)
screen:print(140,120,"'O' Back to Main Menu",yellow)
if pad:circle() then
dofile("./script.lua")
end
if pad:cross() then
dofile("./free.lua")
end
	screen.waitVblankStart()
	screen.flip()
end


