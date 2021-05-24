-- The global private table for EMA.
TRPrivate = {}
TRPrivate.Core = {}
TRPrivate.Communications = {}
TRPrivate.Message = {}
TRPrivate.Team = {}
TRPrivate.Tag = {}

-- The global public API table for EMA.
_G.TRAPI = {}

local TR = LibStub( "AceAddon-3.0" ):NewAddon( 
	"TRAddon",
	"AceConsole-3.0" 
)

local AceGUI = LibStub("AceGUI-3.0")

-- EMACore is not a module, but the same naming convention for these values is convenient.
TR.moduleName = "TR-Core"
TR.chatCommand = "tr"

-- Initialize the addon
function TR:OnInitialize()
	TR:RegisterChatCommand(TR.chatCommand, "ShowFrame")
	print("TooltipRatings Initialized")
end

function TR:OnEnable()
	print("TooltipRatings Enabled")
end

function TR:OnDisable()
	print("TooltipRatings Disabled")
end

function TR:ShowFrame(input)
	-- function that draws the widgets for the first tab
	local function DrawGroup1(container)
	  local desc = AceGUI:Create("Label")
	  desc:SetText("This is Tab 1")
	  desc:SetFullWidth(true)
	  container:AddChild(desc)
	  
	  local button = AceGUI:Create("Button")
	  button:SetText("Tab 1 Button")
	  button:SetWidth(200)
	  container:AddChild(button)
	end

	-- function that draws the widgets for the second tab
	local function DrawGroup2(container)
	  local desc = AceGUI:Create("Label")
	  desc:SetText("This is Tab 2")
	  desc:SetFullWidth(true)
	  container:AddChild(desc)
	  
	  local button = AceGUI:Create("Button")
	  button:SetText("Tab 2 Button")
	  button:SetWidth(200)
	  container:AddChild(button)
	end

	-- Callback function for OnGroupSelected
	local function SelectGroup(container, event, group)
	   container:ReleaseChildren()
	   if group == "tab1" then
		  DrawGroup1(container)
	   elseif group == "tab2" then
		  DrawGroup2(container)
	   end
	end
	
	-- Create the frame container
	local frame = AceGUI:Create("Frame")
	frame:SetTitle("Example Frame")
	frame:SetStatusText("AceGUI-3.0 Example Container Frame")
	frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
	-- Fill Layout - the TabGroup widget will fill the whole frame
	frame:SetLayout("Fill")

	-- Create the TabGroup
	local tab =  AceGUI:Create("TabGroup")
	tab:SetLayout("Flow")
	-- Setup which tabs to show
	tab:SetTabs({{text="Tab 1", value="tab1"}, {text="Tab 2", value="tab2"}})
	-- Register callback
	tab:SetCallback("OnGroupSelected", SelectGroup)
	-- Set initial Tab (this will fire the OnGroupSelected callback)
	tab:SelectTab("tab1")

	-- add to the frame container
	frame:AddChild(tab)

	print("TR:ShowFrame")
end





