local read_manufacturer_specific_attribute = require "st.zigbee.cluster_base".read_manufacturer_specific_attribute
local TuyaSpecificClusterId = 0xE001
local TuyaSpecificAttrId = 0xD011


-- returns formatted ReadAttribute
-- ZigbeeMessageTx from specific
-- device
--
-- @param device ZigbeeDevice
local function ReadTuyaSpecific(device)
  return assert(read_manufacturer_specific_attribute(
    device,
    TuyaSpecificClusterId,
    TuyaSpecificAttrId, 1))
end


return ReadTuyaSpecific