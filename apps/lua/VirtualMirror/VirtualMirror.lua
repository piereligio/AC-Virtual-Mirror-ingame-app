local config = ac.storage{
  backgroundColor = rgbm(0.0, 0.0, 0.0,0.3),
  foregroundColor = rgbm(1,1,1, 0.8),
  colorScheme = "default"
}

function script.windowSettings(dt)
  ui.header('Color Scheme')
  if ui.radioButton('LightTransparent', config.colorScheme == "lighttransparent") then 
    config.colorScheme = "lighttransparent" 
    config.backgroundColor = rgbm(0.0, 0.0, 0.0,0.3)
    config.foregroundColor = rgbm(1,1,1, 0.8)
  end
  if ui.radioButton('LightMoreTransparent', config.colorScheme == "lightmoretransparent") then 
    config.colorScheme = "lightmoretransparent" 
    config.backgroundColor = rgbm(0.0, 0.0, 0.0,0.25)
    config.foregroundColor = rgbm(1,1,1, 0.6)
  end
  if ui.radioButton('Light', config.colorScheme == "light") then 
    config.colorScheme = "light"
    config.backgroundColor = rgbm(0.0, 0.0, 0.0, 1)
    config.foregroundColor = rgbm(0.8,0.8,0.8, 1)
  end
  if ui.radioButton('Inverted', config.colorScheme == "inverted") then 
    config.colorScheme = "inverted"
    config.backgroundColor = rgbm(1,1,1, 1)
    config.foregroundColor = rgbm(0.0, 0.0, 0.0, 1)
  end
  if ui.radioButton('DarkTransparent', config.colorScheme == "darktransparent") then 
    config.colorScheme = "darktransparent" 
    config.backgroundColor = rgbm(1,1,1, 0.6)
    config.foregroundColor = rgbm(0.0, 0.0, 0.0,0.7)
  end
  if ui.radioButton('DarkerTransparent', config.colorScheme == "darkertransparent") then 
    config.colorScheme = "darkertransparent"
    config.backgroundColor = rgbm(1,1,1, 0.6)
    config.foregroundColor = rgbm(0.0, 0.0, 0.0, 0.8)
  end
end

function script.windowMain(dt)
  local sw = ui.windowWidth()
  local sh = ui.windowHeight()
  local w = sh * 4/1
  if (ac.getSim().cameraMode < 3) then
    ui.drawRectFilled(vec2((sw - w) / 2, 0), vec2((sw + w) / 2, sh), config.backgroundColor) 
    ui.drawVirtualMirror(vec2((sw - w) / 2, 0), vec2((sw + w) / 2, sh), config.foregroundColor)
  end
end

