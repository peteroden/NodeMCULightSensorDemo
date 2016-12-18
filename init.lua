config = require("config")
iothub = require("iothub")
wireless = require("wireless")
sensor = require("sensor")

wireless.init()
iothub.init()
iothub.publish("light",'{"intensity":"high"}')

-- sensor.enable()
