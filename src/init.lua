local battery = require "st.capabilities".battery
local button = require "st.capabilities".button

local ZigbeeDriver = require "st.zigbee"
local PowerConfiguration = require "st.zigbee.zcl.clusters".PowerConfiguration
local OnOff = require "st.zigbee.zcl.clusters".OnOff
local OnOffButtonCommandId = 0xFD
local OnOffSmartKnobCommandId = 0xFC

-- local modules
local init = require "lifecycles".init
local added = require "lifecycles".added
local do_configure = require "lifecycles".do_configure

local emitter = require "emitter"


-- Edge Driver Configuration
local driver_config = {
  supported_capabilities = {
    battery,
    button
  },
  lifecycle_handlers = {
    init = init,
    added = added,
    doConfigure = do_configure
  },
  zigbee_handlers = {
    attr = {
      [PowerConfiguration.ID] = {
        [PowerConfiguration.attributes.BatteryPercentageRemaining.ID] = emitter.send_battery_level_event
      }
    },
    cluster = {
      [OnOff.ID] = {
        [OnOffButtonCommandId] = emitter.send_button_event,
        [OnOffSmartKnobCommandId] = emitter.send_knob_event
      }
    }
  }
}


local driver = ZigbeeDriver("zigbee-button-battery-v1.0.0", driver_config)
driver:run()