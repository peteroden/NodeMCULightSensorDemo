--file name: config.lua
local module = {}
    -- module.SSID = {}
    --  module.SSID["SSID"] = "WiFi PASSWORD"
    module.ID = node.chipid()
    module.HOST = "IotLightSensorDemo.azure-devices.net"
    module.PORT = 8883
    module.USERNAME = "IotLightSensorDemo.azure-devices.net/"..module.ID
    module.PASSWORD = "SharedAccessSignature sig={signature}&se={expiry}&sr={URL-encoded-resourceURI}"
    module.ENDPOINT = "devices/"..module.ID.."/messages"
return module