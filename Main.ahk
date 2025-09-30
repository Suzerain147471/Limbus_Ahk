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

