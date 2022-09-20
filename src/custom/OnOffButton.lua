local OnOff = require "st.zigbee.zcl.clusters".OnOff
local build_cluster_attribute = require "st.zigbee.cluster_base".build_cluster_attribute
local Enum8 = require "st.zigbee.data_types".Enum8
local OnOffButtonAttr = 0x8004
local OnOffButtonAttrLabel = "OnOffButton"

-- returns prebuilt attribute
-- on top of OnOff (0x0006) cluster
-- which is used by device to emit
-- button-specific events.
return assert(
  build_cluster_attribute(
  OnOff,                -- cluster
  OnOffButtonAttr,      -- attr_id
  OnOffButtonAttrLabel, -- attr_name
  Enum8,                -- data_type
  true))                -- is_writable