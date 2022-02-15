Set objArgs = WScript.Arguments
msgTtl = objArgs(0)
msgTxt = objArgs(1)
msgTyp = objArgs(2)
n=msgbox(msgTtl,msgTyp,msgTxt)