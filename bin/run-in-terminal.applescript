#!/usr/bin/env osascript

on run argv
  tell application "Terminal"
  if (count of windows) is 0 then
  do script argv
  else
  do script argv in window 1
  end if
  activate
  end tell
end run
