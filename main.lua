repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR")



game:GetService("RunService").RenderStepped:Connect(
function()
	for L_23_forvar0, L_24_forvar1 in pairs(game.CoreGui:GetChildren()) do
		if L_24_forvar1.Name == "PostmansAutoRob" then
			L_24_forvar1:Destroy()
		end
	end
	for L_25_forvar0, L_26_forvar1 in pairs(game.CoreGui:GetChildren()) do
		if L_26_forvar1.Name == "WarningGUI" then
			L_26_forvar1:Destroy()
		end
	end
end
)
game.StarterGui:SetCore(
	"SendNotification",
	{
		Title = "goodnight",
		Text = "",
	}
)
local L_3_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/e-bitch/aimlock/main/source.lua"))()
local L_4_ = L_3_.CreateLib("D34TH Aimlock [15x (Cracked :D)]", "Serpent")
local L_5_ = L_4_:NewTab("Aimlock")
local L_6_ = L_5_:NewSection("15x")
L_6_:NewButton(
	"Aimlock",
	"Enable Aimlock [q]",
	function()
		getgenv().AimPart = "HumanoidRootPart"
		getgenv().AimlockKey = "q"
		getgenv().AimRadius = 30
		getgenv().ThirdPerson = true
		getgenv().FirstPerson = true
		getgenv().TeamCheck = false
		getgenv().PredictMovement = true
		getgenv().PredictionVelocity = 9
		local L_27_, L_28_, L_29_, L_30_ =
			game:GetService "Players",
		game:GetService "UserInputService",
		game:GetService "RunService",
		game:GetService "StarterGui"
		local L_31_, L_32_, L_33_, L_34_, L_35_, L_36_, L_37_ =
			L_27_.LocalPlayer,
		L_27_.LocalPlayer:GetMouse(),
		workspace.CurrentCamera,
		CFrame.new,
		Ray.new,
		Vector3.new,
		Vector2.new
		local L_38_, L_39_, L_40_ = true, false, false
		local L_41_
		getgenv().CiazwareUniversalAimbotLoaded = true
		getgenv().WorldToViewportPoint = function(L_42_arg0)
			return L_33_:WorldToViewportPoint(L_42_arg0)
		end
		getgenv().WorldToScreenPoint = function(L_43_arg0)
			return L_33_.WorldToScreenPoint(L_33_, L_43_arg0)
		end
		getgenv().GetObscuringObjects = function(L_44_arg0)
			if L_44_arg0 and L_44_arg0:FindFirstChild(getgenv().AimPart) and L_31_ and L_31_.Character:FindFirstChild("Head") then
				local L_45_ = workspace:FindPartOnRay(L_35_(L_44_arg0[getgenv().AimPart].Position, L_31_.Character.Head.Position))
				if L_45_ then
					return L_45_:IsDescendantOf(L_44_arg0)
				end
			end
		end
		getgenv().GetNearestTarget = function()
			local L_46_ = {}
			local L_47_ = {}
			local L_48_ = {}
			for L_50_forvar0, L_51_forvar1 in pairs(L_27_:GetPlayers()) do
				if L_51_forvar1 ~= L_31_ then
					table.insert(L_46_, L_51_forvar1)
				end
			end
			for L_52_forvar0, L_53_forvar1 in pairs(L_46_) do
				if L_53_forvar1.Character ~= nil then
					local L_54_ = L_53_forvar1.Character:FindFirstChild("Head")
					if getgenv().TeamCheck == true and L_53_forvar1.Team ~= L_31_.Team then
						local L_55_ =
							(L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
						local L_56_ =
							Ray.new(
								game.Workspace.CurrentCamera.CFrame.p,
								(L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_55_
							)
						local L_57_, L_58_ = game.Workspace:FindPartOnRay(L_56_, game.Workspace)
						local L_59_ = math.floor((L_58_ - L_54_.Position).magnitude)
						L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
						L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_55_
						L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
						L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_59_
						table.insert(L_48_, L_59_)
					elseif getgenv().TeamCheck == false and L_53_forvar1.Team == L_31_.Team then
						local L_60_ =
							(L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
						local L_61_ =
							Ray.new(
								game.Workspace.CurrentCamera.CFrame.p,
								(L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_60_
							)
						local L_62_, L_63_ = game.Workspace:FindPartOnRay(L_61_, game.Workspace)
						local L_64_ = math.floor((L_63_ - L_54_.Position).magnitude)
						L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
						L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_60_
						L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
						L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_64_
						table.insert(L_48_, L_64_)
					end
				end
			end
			if unpack(L_48_) == nil then
				return nil
			end
			local L_49_ = math.floor(math.min(unpack(L_48_)))
			if L_49_ > getgenv().AimRadius then
				return nil
			end
			for L_65_forvar0, L_66_forvar1 in pairs(L_47_) do
				if L_66_forvar1.diff == L_49_ then
					return L_66_forvar1.plr
				end
			end
			return nil
		end
		L_32_.KeyDown:Connect(
			function(L_67_arg0)
				if L_67_arg0 == AimlockKey and L_41_ == nil then
					pcall(
						function()
							if L_39_ ~= true then
								L_39_ = true
							end
							local L_68_
							L_68_ = GetNearestTarget()
							if L_68_ ~= nil then
								L_41_ = L_68_
							end
						end
					)
				elseif L_67_arg0 == AimlockKey and L_41_ ~= nil then
					if L_41_ ~= nil then
						L_41_ = nil
					end
					if L_39_ ~= false then
						L_39_ = false
					end
				end
			end
		)
		L_29_.RenderStepped:Connect(
			function()
				if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then
					if
						(L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 or
						(L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1
					then
						L_40_ = true
					else
						L_40_ = false
					end
				elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then
					if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 then
						L_40_ = true
					else
						L_40_ = false
					end
				elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then
					if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1 then
						L_40_ = true
					else
						L_40_ = false
					end
				end
				if L_38_ == true and L_39_ == true then
					if L_41_ and L_41_.Character and L_41_.Character:FindFirstChild(getgenv().AimPart) then
						if getgenv().FirstPerson == true then
							if L_40_ == true then
								if getgenv().PredictMovement == true then
									L_33_.CFrame =
										L_34_(
											L_33_.CFrame.p,
											L_41_.Character[getgenv().AimPart].Position +
											L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
										)
								elseif getgenv().PredictMovement == false then
									L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
								end
							end
						elseif getgenv().ThirdPerson == true then
							if L_40_ == true then
								if getgenv().PredictMovement == true then
									L_33_.CFrame =
										L_34_(
											L_33_.CFrame.p,
											L_41_.Character[getgenv().AimPart].Position +
											L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
										)
								elseif getgenv().PredictMovement == false then
									L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
								end
							end
						end
					end
				end
			end
		)
	end
)
L_6_:NewTextBox(
	"Aimlock Key",
	"Aimlock Key should be lowercase.",
	function(L_69_arg0)
		getgenv().AimlockKey = L_69_arg0
	end
)
L_6_:NewTextBox(
	"Aimlock Prediction",
	"Customize your aimlock prediction",
	function(L_70_arg0)
		PredictionVelocity = L_70_arg0
	end
)
L_6_:NewDropdown(
	"AimPart",
	"",
	{
		"Head",
		"UpperTorso",
		"HumanoidRootPart",
		"LowerTorso"
	},
	function(L_71_arg0)
		getgenv().AimPart = L_71_arg0
	end
)
local Silent = true
local L_7_ = L_4_:NewTab("Silent Aim")
local L_8_ = L_7_:NewSection("15x")

L_8_:NewToggle("Silent Aim", "Enable and Disable silent aim", function(state)
	if state then
		if Silent then
			loadstring(game:HttpGet("https://github.com/e-bitch/aimlock/blob/main/extra", true))()
			Silent = false
		end
		DaHoodSettings.SilentAim = true
	else
		DaHoodSettings.SilentAim = false
		print("Toggle Off")
	end
end
)


L_8_:NewDropdown(
	"Silent Aim Part",
	"",
	{
		"Head",
		"UpperTorso",
		"HumanoidRootPart",
		"LowerTorso"
	},
	function(L_73_arg0)
		Aiming.TargetPart = L_73_arg0
	end
)
L_8_:NewTextBox(
	"Silent Aim Fov",
	"Change the FOV of the silent aim",
	function(L_74_arg0)
		Aiming.FOV = L_74_arg0
	end
)
L_8_:NewToggle(
	"Silent Aim Show Fov",
	"Show the FOV",
	function(L_75_arg0)
		Aiming.ShowFOV = L_75_arg0
	end
)

local L_13_ = L_4_:NewTab("Settings")
local L_14_ = L_13_:NewSection("15X")
L_14_:NewKeybind(
	"Keybind Gui Toggle",
	"h",
	Enum.KeyCode.C,
	function()
		L_3_:ToggleUI()
	end
)
local L_17_ = L_4_:NewTab("ESP")
local L_18_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/e-bitch/aimlock/main/ESP.lua"))()
local L_19_ = L_17_:NewSection("15X")
L_19_:NewToggle(
	"ESP",
	"ESP",
	function(L_201_arg0)
		L_18_:Toggle(L_201_arg0)
	end
)
L_19_:NewToggle(
	"Tracers",
	"ESP Tracers",
	function(L_202_arg0)
		L_18_.Tracers = L_202_arg0
	end
)
L_19_:NewToggle(
	"Names",
	"ESP Names",
	function(L_203_arg0)
		L_18_.Names = L_203_arg0
	end
)
L_19_:NewToggle(
	"Boxes",
	"ESP Boxes",
	function(L_204_arg0)
		box = true
		L_18_.Boxes = L_204_arg0
	end
)
