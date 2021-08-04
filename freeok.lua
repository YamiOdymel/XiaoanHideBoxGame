white = Color.new(255,255,255) 
red = Color.new(255,0,0) 
ho = Color.new(192,192,192) 
yellow = Color.new(255,255,0) 
while true do
screen:clear()
pad = Controls.read()
screen:print(152,52,"Xiaoan Hide Box Game",ho)
screen:print(150,50,"Xiaoan Hide Box Game",white)
screen:print(200,200,"'X' Next level",red)
if pad:cross() then
start()
end
	screen.waitVblankStart()
	screen.flip()
end


