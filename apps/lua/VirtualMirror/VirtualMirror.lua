local config = ac.storage{
  colorScheme = "LightTransparent"
}

local colorSchemes = {
  LightTransparent = {
    background = rgbm(0.0, 0.0, 0.0, 0.3),
    foreground = rgbm(1, 1, 1, 0.8)
  },
  LightMoreTransparent = {
    background = rgbm(0.0, 0.0, 0.0, 0.25),
    foreground = rgbm(1, 1, 1, 0.6)
  },
  Light = {
    background = rgbm(0.0, 0.0, 0.0, 1),
    foreground = rgbm(0.8, 0.8, 0.8, 1)
  },
  Inverted = {
    background = rgbm(1, 1, 1, 1),
    foreground = rgbm(0.0, 0.0, 0.0, 1)
  },
  DarkTransparent = {
    background = rgbm(1, 1, 1, 0.6),
    foreground = rgbm(0.0, 0.0, 0.0, 0.7)
  },
  DarkerTransparent = {
    background = rgbm(1, 1, 1, 0.6),
    foreground = rgbm(0.0, 0.0, 0.0, 0.8)
  }
}

function script.windowSettings(dt)
  ui.header('Color Scheme')
  for name, _ in pairs(colorSchemes) do
    if ui.radioButton(name, config.colorScheme == name) then
      config.colorScheme = name
    end
  end
end

function script.windowMain(dt)
  local sw = ui.windowWidth()
  local sh = ui.windowHeight()
  local w = sh * 4/1
  if ac.getSim().cameraMode < 3 then
    local colors = colorSchemes[config.colorScheme]
    ui.drawRectFilled(vec2((sw - w) / 2, 0), vec2((sw + w) / 2, sh), colors.background) 
    ui.drawVirtualMirror(vec2((sw - w) / 2, 0), vec2((sw + w) / 2, sh), colors.foreground)
  end
end