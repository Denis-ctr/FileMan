import nigui
import appstatefile
import os
import times

app.init()

var
  window = newWindow("FileMan")
  mainContainer = newLayoutContainer(Layout_Vertical)
  lastClickTime: float = 0
  lastClickedPath: string = ""

window.width = 800
window.height = 600
window.add(mainContainer)

var 
  topButtons = newLayoutContainer(Layout_Horizontal)
  pathLabel = newLabel("")
  itemsArea = newTextArea("")


itemsArea.editable = false

mainContainer.add(topButtons)
mainContainer.add(pathLabel)
mainContainer.add(itemsArea)

var
  backButton = newButton("Back")
  refreshButton = newButton("Refresh")
  openButton = newButton("Open")
  
topButtons.add(backButton)
topButtons.add(refreshButton)
topButtons.add(openButton)

proc updateUI()

proc getSelectedLineIndex(): int =
  var lineIdx = 0
  for i, c in itemsArea.text:
    if i >= itemsArea.cursorPos:
      break
    if c == '\n':
      lineIdx += 1
  return lineIdx

proc openSelectedItem() =
  let lineIdx = getSelectedLineIndex()
  
  if lineIdx < len(appState.allItems):
    let item = appState.allItems[lineIdx]
    
    if item.isFolder:
      appState.currentPath = item.name
      updateUI()
    else:
      when defined(windows):
        discard execShellCmd("start \"\" \"" & item.name & "\"")
      elif defined(macosx):
        discard execShellCmd("open \"" & item.name & "\"")
      else:
        discard execShellCmd("xdg-open \"" & item.name & "\"")

proc updateUI() =
  refresh()
  pathLabel.text = "Path: " & appState.currentPath
  
  var text = ""
  for item in appState.allItems:
    if item.isFolder:
      text.add("[DIR]  " & extractFilename(item.name) & "\n")
    else:
      text.add("[FILE] " & extractFilename(item.name) & "\n")
  
  itemsArea.text = text


itemsArea.onClick = proc(event: ClickEvent) =
  let lineIdx = getSelectedLineIndex()
  let now = epochTime()
  let currentItem = if lineIdx < len(appState.allItems): appState.allItems[lineIdx].name else: ""
  
  if currentItem == lastClickedPath and (now - lastClickTime) < 0.5:
    openSelectedItem()
    lastClickedPath = ""
  else:
    lastClickedPath = currentItem
    lastClickTime = now


openButton.onClick = proc(event: ClickEvent) =
  openSelectedItem()

backButton.onClick = proc(event: ClickEvent) =
  let parent = parentDir(appState.currentPath)
  if parent != appState.currentPath:
    appState.currentPath = parent
    updateUI()

refreshButton.onClick = proc(event: ClickEvent) =
  updateUI()

initState()
updateui()
window.show()
app.run()
