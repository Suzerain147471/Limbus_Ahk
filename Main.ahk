#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode "Mouse", "Window"
SendMode 'Event'

MyGui := Gui(, "LimbusAhK") ; Создание гуи и кнопок основного меню
MyGui.OnEvent("Close", Gui_Close)
MyGui.SetFont("s12") 

MyGui.Add("Button", "xm w150 h50", "Settings").OnEvent("Click", (*) => Settings())
PTWCheckbox := MyGui.Add("Checkbox", "vPtoWinCheckbox", "Press Key to win")
MyGui.Show("Center")

SettingsGui := Gui(, "LimbusAhK") ;Создание гуи настройки
SettingsGui.SetFont("s12")
global DelayCheckbox := SettingsGui.Add("Checkbox", "vDelayCheckbox", "Add delay")
global PriorityCheckbox := SettingsGui.Add("Checkbox", "vPriorityCheckbox", "Set Limbus to High Priority")
global PTWEVCheckbox := SettingsGui.Add("Checkbox", "vPtoWinEVCheckbox", "Press Key to win expanded version")


PriorityCheckbox.OnEvent("Click", SetProcessPriority)

Settings()
{   
    
    SettingsGui.Show("Center")
    SettingsGui.OnEvent("Close", SettingsGui_Close)

}


SettingsGui_Close(*)
{
    SettingsGui.Hide()
}

SetProcessPriority(*)
{
    if (PriorityCheckbox.Value)
    {    
        try 
        {
            
            pid := ProcessExist("LimbusCompany.exe") ; Получает PID по имени процесса
            if (pid) 
            {
                ProcessSetPriority "High", pid
            } 
            else 
            {
                PriorityCheckbox.Value := 0 

            }
        }
    }   
    else
    {
            pid := ProcessExist("LimbusCompany.exe")
            if (pid) 
            {
                ProcessSetPriority "Normal", pid
            } 
            else 
            {
                PriorityCheckbox.Value := 0 ; Снятие галочки

            }
    }
}


*SC019:: ;Клавиша P
{
    if (PTWCheckbox.Value) ;Проверка галочки
    {
        {
            PressWinRate()
        }
    }
    else
    {
        Send "{Blind}{SC019}" ; Использует клавишу как обычно
    }
}

PressWinRate()
{
    ActiveWindow := WinGetID("A") ;Запоминает окно
        WinActivate "LimbusCompany" ;Открывает окно LimbusCompany

        SetDelay()

        ControlSend("{Blind}{SC019}", , "LimbusCompany") ;Нажимает P
        Sleep 100
        ControlSend("{Blind}{Enter}", , "LimbusCompany") ;Нажимает Enter

        SetDelay()

        WinActivate ActiveWindow ;Возвращает окно
}

*Numpad7::
{
    if (PTWEVCheckbox.Value and PTWCheckbox.Value)
        {
            ActiveWindow := WinGetID("A") ;Запоминает окно
            MouseGetPos &mouseX, &mouseY ;Запоминает позицию мыши
            WinActivate "LimbusCompany" ;Открывает окно LimbusCompany
    
            SetDelay()

            Click 300, 600
            Sleep 200

            SetDelay()

            WinActivate ActiveWindow ;Возвращает окно
            MouseMove mouseX, mouseY ;Возвращяет мышь
        }
}

*Numpad8::
{
    if (PTWEVCheckbox.Value and PTWCheckbox.Value)
        {
            ActiveWindow := WinGetID("A") ;Запоминает окно
            MouseGetPos &mouseX, &mouseY ;Запоминает позицию мыши
            WinActivate "LimbusCompany" ;Открывает окно LimbusCompany
    
            SetDelay()

            Click 532, 600
            Sleep 200

            SetDelay()

            WinActivate ActiveWindow ;Возвращает окно
            MouseMove mouseX, mouseY ;Возвращяет мышь
        }
}

*Numpad9::
{
    if (PTWEVCheckbox.Value and PTWCheckbox.Value)
        {
            ActiveWindow := WinGetID("A") ;Запоминает окно
            MouseGetPos &mouseX, &mouseY ;Запоминает позицию мыши
            WinActivate "LimbusCompany" ;Открывает окно LimbusCompany
    
            SetDelay()

            Click 779, 600
            Sleep 200

            SetDelay()

            WinActivate ActiveWindow ;Возвращает окно
            MouseMove mouseX, mouseY ;Возвращяет мышь
        }
}

*NumpadAdd::
{
    if (PTWEVCheckbox.Value and PTWCheckbox.Value)
        {
            ActiveWindow := WinGetID("A") ;Запоминает окно
            MouseGetPos &mouseX, &mouseY ;Запоминает позицию мыши
            WinActivate "LimbusCompany" ;Открывает окно LimbusCompany
    
            SetDelay()

            Click 1036, 600
            Sleep 200

            SetDelay()

            WinActivate ActiveWindow ;Возвращает окно
            MouseMove mouseX, mouseY ;Возвращяет мышь
        }
}

*Numpad4::
{
    if (PTWEVCheckbox.Value and PTWCheckbox.Value)
        {
            ActiveWindow := WinGetID("A") ;Запоминает окно
            MouseGetPos &mouseX, &mouseY ;Запоминает позицию мыши
            WinActivate "LimbusCompany" ;Открывает окно LimbusCompany
    
            SetDelay()

            Click 718, 199
            Sleep 200

            SetDelay()

            WinActivate ActiveWindow ;Возвращает окно
            MouseMove mouseX, mouseY ;Возвращяет мышь
        }
}

*Numpad5::
{
    if (PTWEVCheckbox.Value and PTWCheckbox.Value)
        {
            ActiveWindow := WinGetID("A") ;Запоминает окно
            MouseGetPos &mouseX, &mouseY ;Запоминает позицию мыши
            WinActivate "LimbusCompany" ;Открывает окно LimbusCompany
    
            SetDelay()

            Click 720, 405
            Sleep 200

            SetDelay()

            WinActivate ActiveWindow ;Возвращает окно
            MouseMove mouseX, mouseY ;Возвращяет мышь
        }
}

*Numpad6::
{
    if (PTWEVCheckbox.Value and PTWCheckbox.Value)
        {
            ActiveWindow := WinGetID("A") ;Запоминает окно
            MouseGetPos &mouseX, &mouseY ;Запоминает позицию мыши
            WinActivate "LimbusCompany" ;Открывает окно LimbusCompany
    
            SetDelay()

            Click 737, 629
            Sleep 200

            SetDelay()

            WinActivate ActiveWindow ;Возвращает окно
            MouseMove mouseX, mouseY ;Возвращяет мышь
        }
}

*NumpadEnter::
{
    if (PTWEVCheckbox.Value and PTWCheckbox.Value)
        {
            ActiveWindow := WinGetID("A") ;Запоминает окно
            MouseGetPos &mouseX, &mouseY ;Запоминает позицию мыши
            WinActivate "LimbusCompany" ;Открывает окно LimbusCompany
    
            SetDelay()

            ControlSend("{Blind}{Enter}", , "LimbusCompany") ;Нажимает Enter

            SetDelay()

            WinActivate ActiveWindow ;Возвращает окно
            MouseMove mouseX, mouseY ;Возвращяет мышь
        }
}

SetDelay()
{
    if (DelayCheckbox.Value) ;Добавляет задержу если галочка стоит
    {
    Sleep 150
    }
}


Gui_Close(*)
{
    ExitApp() ;Выход их АХК
}

F12::
{
    ExitApp() ;Выход их АХК
}

