white = Color.new(255,255,255)
red = Color.new(255,0,0)
ho = Color.new(192,192,192)
yellow = Color.new(255,255,0)

while true do
screen:clear()
pad = Controls.read()
screen:print(152,52,"Xiaoan Hide Box Game Help",ho)
screen:print(150,50,"Xiaoan Hide Box Game Help",white)
screen:print(30,80,"Game --",ho)
screen:print(1,130,"the game is way fun, it's just the arrow keys to control.",yellow)
screen:print(30,150,"Free Mode --",ho)
screen:print(1,190,"Yes, this pattern will be random number generator box,",yellow)
screen:print(1,200,"and unlimited points.",yellow)
screen:print(200,250,"Press 'triangle' go back",red)
if pad:triangle() then
dofile("./script.lua")
end
	screen.waitVblankStart()
	screen.flip()
end


