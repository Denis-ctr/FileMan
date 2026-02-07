include fmlogic
import std/os

type
  FileItem* = object
    name*: string
    isFolder*: bool


type
  AppState* = object  
    currentPath*: string  
    file*: seq[string]
    folders*: seq[string]
    allItems*: seq[FileItem]

var
  appState*: AppState  

proc refresh*() =
  let (vfiles, vfolders) = list(appState.currentPath)
  appState.file = vfiles
  appState.folders = vfolders
  appState.allItems = @[]

  for fold in vfolders:
    appState.allItems.add(FileItem(name: fold, isFolder: true))

  for file in vfiles:
    appState.allItems.add(FileItem(name: file, isFolder: false))


proc initState*() =
  appState.currentPath = getCurrentDir()
  refresh()
  

