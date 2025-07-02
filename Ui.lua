local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "MarkHub",
   LoadingTitle = "MarkHub | Emergency Hamburg",
   LoadingSubtitle = "Made by DeadMark666X",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MarkHub",
      FileName = "Settings"
   },
   KeySystem = true,
   KeySettings = {
      Title = "MarkHub Key System",
      Subtitle = "",
      Note = "",
      FileName = "MarkKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"MARKHUB666"}
   }
})

local MainTab = Window:CreateTab("Main", 4483362458)
MainTab:CreateParagraph({ Title = "Welcome!", Content = "MarkHub v1 loaded." })
