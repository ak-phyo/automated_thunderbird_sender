dim s
Set s = CreateObject("WScript.Shell") 
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile("maillist.txt")
Dim objFSO
Const ForReading = 1
Const ForWriting = 2
Dim objTS 'define a TextStream object
Dim strContents
Dim fileSpec

phishurl="http://host/download/mydrive.html"
findstring = "abcdef"
replacestring = ""
subj = "hello world"

message = "C:\Users\user\template.html"
fileSpec = "C:\Users\user\template.html"


  
Do Until f.AtEndOfStream
  WScript.Sleep 2000

  
  lineno = f.ReadLine
  mailaddr = Split(lineno,":")(0)
  trackingno = Split(lineno,":")(1)
  'name = firstName
  replacelink = phishurl & "?suid=" & trackingno
  Set objFSO = CreateObject("Scripting.FileSystemObject")
  Set objTS = objFSO.OpenTextFile(fileSpec, ForReading)
  strContents = objTS.ReadAll
  strContents = Replace(strContents, findstring, replacelink)
  objTS.Close
  Set objTS = objFSO.OpenTextFile(fileSpec, ForWriting)
  objTS.Write strContents
  objTS.Close
  findstring = replacelink
  replacestring = findstring

  'WScript.Echo firstName
  s.run chr(34) & "c:\Program Files\mozilla thunderbird\thunderbird.exe" & chr(34) & _
            "-compose " & """" & _
            "preselectid=id1," & _
            "to='" & mailaddr & "'," & _
            "subject='" & subj & "'," & _
            "message='" & message & "'" & """"
            '"body='" & body & "'" & """"
  
  WScript.Sleep 2500
  s.SendKeys "^{ENTER}"
Loop
f.Close

 Set objTS = objFSO.OpenTextFile(fileSpec, ForReading)
  strContents = objTS.ReadAll
  strContents = Replace(strContents, replacestring, "abcdef")
  objTS.Close
  Set objTS = objFSO.OpenTextFile(fileSpec, ForWriting)
  objTS.Write strContents
  objTS.Close
