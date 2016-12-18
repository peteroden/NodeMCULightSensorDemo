local module = {}
m = nil
-- Sends a simple ping to the broker

function module.publish(property, value)  
    m:publish(config.ENDPOINT .."/events/"..property,value,0,1)
    print("Published the status")
end

-- Sends my id to the broker for registration
local function register()
    print("Subscribing for devicebound messages")
    m:subscribe(config.ENDPOINT.."/devicebound/#" ,0,function(conn)
        print("Successfully subscribed to receive devicebound messages")
        --send_ping()
    end)
end

function module.init() 
    m = mqtt.Client(config.ID, 120,config.USERNAME,config.PASSWORD)

    -- on connection to server
    m:on("connect", function(con) print ("connected") end)

    -- on disconnect from server
    m:on("offline", function(con)
        print ("disconnected")
        -- try reconnecting when disconnected
        m:connect(config.HOST, config.PORT, 1, 1, function(con) 
            print("Reconnected to broker")
        end)
    end)

    -- on receive message
    m:on("message", function(conn, topic, data) 
        if data ~= nil then
        print(topic .. ": " .. data)
        -- do something, we have received a message
        end
    end)

    -- Connect to broker
    print("Connecting to broker")
    m:connect(config.HOST, config.PORT, 1, 1, function(con) 
        print("Connected to broker")
        module.register();
    end)
end
return module