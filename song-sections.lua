sections = {}
sections["Intro"] = 8
sections["A"] = 4

path = reaper.GetProjectPath("")
filename = "sections.txt"
filePath = path .. "\\" .. filename
reaper.ShowConsoleMsg(filePath .. "\n")

function main()

  file = io.open(filePath, "w")
  io.output(file)

  i=0
  repeat
    iRetval, bIsRegion, iPos, iRgnend, sName, iMarkrgnindexnumber, iColor = reaper.EnumProjectMarkers3(0,i)
    if iRetval >= 1 and bIsRegion then
      regionLength = iRgnend - iPos
      sectionLength = sections[sName]
      
      if sectionLength then
        nRetval, nMeasures, nCml, nFullbeats, nCdenom = reaper.TimeMap2_timeToBeats(0, regionLength)
        sectionRepeats = nFullbeats / sectionLength
        
        io.write(sName .. " x " .. sectionRepeats .. "\n")
      else
        reaper.ShowConsoleMsg("Section length not defined for " .. sName .. "\n")
      end
      
      i = i+1
    end
  until iRetval == 0
  
  io.close(file)
  
end


-- INIT ---------------------------------------------------------------------

-- Here: your conditions to avoid triggering main without reason.

reaper.PreventUIRefresh(1)

reaper.Undo_BeginBlock() -- Begining of the undo block. Leave it at the top of your main function.

main()

reaper.Undo_EndBlock("My action", -1) -- End of the undo block. Leave it at the bottom of your main function.

reaper.UpdateArrange()

reaper.PreventUIRefresh(-1)
