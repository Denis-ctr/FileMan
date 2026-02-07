import os


proc list*(path: string): (seq[string],seq[string]) =
  var vfiles: seq[string] = @[]
  for file in walkFiles(path & "/*"):
    vfiles.add file


  var vfolders: seq[string] = @[]
  for dir in walkDirs(path & "/*"):
    vfolders.add dir

  return (vfiles, vfolders)

