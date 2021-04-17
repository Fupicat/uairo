extends Node2D

var ganhou = false

func _ready():
    $Timer.wait_time = 4 / Global.speed
    $Timer.start()
    print(str($Timer.wait_time))

func _input(event):
    if event.is_action_pressed("ui_accept"):
        $Label.text = "GANHASTE"
        $icon.modulate = Color(0, 255, 0)
        ganhou = true

func _on_Timer_timeout():
    if ganhou:
        Global.win()
    else:
        Global.lose()
