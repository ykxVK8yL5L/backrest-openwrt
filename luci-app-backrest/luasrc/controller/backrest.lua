module("luci.controller.backrest", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/backrest") then return end
	entry({"admin", "nas"}, firstchild(), _("NAS") , 45).dependent = false
	entry({"admin", "nas", "backrest"}, cbi("backrest"), _("Backrest"), 100 ).dependent = false
end
