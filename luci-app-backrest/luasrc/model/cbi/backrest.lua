require('luci.sys')
require('luci.util')

local ipkg = require('luci.model.ipkg')

local fs = require 'nixio.fs'

local uci = require 'luci.model.uci'.cursor()

local m, s

local running = (luci.sys.call('pidof backrest > /dev/null') == 0)

local state_msg = ''
local trport = uci:get('backrest', 'config', 'port')

local triptype = uci:get('backrest', 'config', 'addr_type')
local trip = ''

if triptype == 'local' then
    trip = uci:get('network', 'loopback', 'ipaddr')
elseif triptype == 'lan' then
    trip = uci:get('network', 'lan', 'ipaddr')
else
    trip = '[ip]'
end

if running then
    state_msg = '<b><font color="green">' .. translate('backrest running') .. '</font></b>'
    address_msg = translate('backrest address') .. ' : http://' .. trip .. ':' .. trport .. '<br/> <br/>'
else
    state_msg = '<b><font color="red">' .. translate('backrest not run') .. '</font></b>'
    address_msg = ''
end

m =
    Map(
    'backrest',
    translate('Backrest'),
    translate('Backrest is a web-accessible backup solution built on top of restic.') ..
        ' <br/> <br/> ' .. translate('backrest state') .. ' : ' .. state_msg .. '<br/> <br/>'
        .. address_msg ..                                      
        translate('Installed Web Interface') ..                                                                                                                     
        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="cbi-button" style="margin: 0 5px;" value=" ' .. 
        translate('backrestUI') ..                                                                                                                                    
        " \" onclick=\"window.open('http://"..trip..":"..trport.."')\"/> <br/><br/>"  
)


s = m:section(TypedSection, 'global', translate('global'))
s.addremove = false
s.anonymous = true

enable = s:option(Flag, 'enabled', translate('run backrest as daemon'))
enable.rmempty = false

s = m:section(TypedSection, 'conf', translate('configure'))
s.addremove = false
s.anonymous = true

o = s:option(ListValue, 'addr_type', translate('listen address'))
o:value('local', translate('localhost address'))
o:value('lan', translate('local network address'))
o:value('all', translate('all address'))
o.default = 'lan'
o.rmempty = false

o = s:option(Value, 'port', translate('listen port'))
o.placeholder = 5572
o.default = 5572
o.datatype = 'port'
o.rmempty = false


return m
