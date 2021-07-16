"""

This is the background process for AutoControlG
It is currently under development and still has a number of bugs
For those who want to try it now put it in your startup folder on windows
Currently only supports windows


TODO: Check to see if AutoControl is already running when hotkey is pressed, if it is, don't open a new instance
TODO: Close AutoControl when close hotkey is pressed

"""

import keyboard, os

class app:
    running = True

    def stop(self):
        print("closing")
        keyboard.clear_all_hotkeys()
        self.running = False

    def __init__(self):
        keyboard.add_hotkey("ctrl+shift+a", lambda: os.startfile("AutoControlG.exe"))
        keyboard.add_hotkey("ctrl+shift+alt+a", self.stop)

        while self.running:
            if "" == "q":
                self.stop()
                break
app()