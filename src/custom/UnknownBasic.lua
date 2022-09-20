local build_cluster_attribute = require "st.zigbee.cluster_base".build_cluster_attribute
local Basic = require "st.zigbee.zcl.clusters".Basic
local Enum8 = require "st.zigbee.data_types".Enum8
local UnknownBasicAttrId = 0xFFFE
local UnknownBasicAttrLabel = "UnknownBasicTuyaAttr"


-- returns prebuilt attribute
-- on top of Basic (0x0000) cluster
return assert(
  build_cluster_attribute(
  Basic,
  UnknownBasicAttrId,
  UnknownBasicAttrLabel,
  Enum8,
  false))