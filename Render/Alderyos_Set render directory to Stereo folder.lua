--[[
 * ReaScript Name: Set render directory to Stereo folder
 * Description: Sets the output directory of the render to C:/Render/Stereo
 * Instructions: Load and run the script
 * Author: Alderyos
 * Repository: GitHub > Alderyos > REAPER-ReaScripts
 * Repository URI: https://github.com/Alderyos/REAPER-ReaScripts
 * Licence: GPL v3
 * Forum Thread: Advanced Region Rendering and Management
 * Forum Thread URI: https://forum.cockos.com/showthread.php?p=2427920#post2427920
 * REAPER: 6.25
 * Extensions: None
 * Version: 1.0
--]]
 
--[[
 * Changelog:
 * v1.0 (2021-04-03)
	+ Initial Release
--]]


-- USER CONFIG AREA ---------------------------------------------------------

console = true -- true/false: display debug messages in the console

----------------------------------------------------- END OF USER CONFIG AREA


-- Display a message in the console for debugging
function Msg(value)
	if console then
		reaper.ShowConsoleMsg(tostring(value) .. "\n")
	end
end


-- Main function
function main()

	retval, valuestrNeedBig = reaper.GetSetProjectInfo_String( 0, "RENDER_FILE", "C:/Render/Stereo", true )

end


-- INIT ---------------------------------------------------------------------

-- Here: your conditions to avoid triggering main without reason.

reaper.PreventUIRefresh(1)

reaper.Undo_BeginBlock() -- Begining of the undo block. Leave it at the top of your main function.

main()

reaper.Undo_EndBlock("Alderyos_Set render directory to Stereo folder", -1) -- End of the undo block. Leave it at the bottom of your main function.

reaper.UpdateArrange()

reaper.PreventUIRefresh(-1)
