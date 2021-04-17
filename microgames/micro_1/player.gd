extends Area2D

var botao = false
var morto = false

func _ready():
    $AnimationPlayer.playback_speed = Global.speed
    $"../car/AnimationPlayer2".playback_speed = Global.speed
    $"../Timer".wait_time = 4 / Global.speed
    $"../Timer".start()

func _input(Event):
    if !botao && !morto:
        if Event.is_action_pressed("ui_up"):
            $AnimationPlayer.play("pulo")
            botao = true
        yield($AnimationPlayer, "animation_finished")
        botao = false

func _on_player_area_entered(area: Area2D):
    morto = true
    $AnimationPlayer.stop()
    $"../TACADO".play("taco")

func _on_TACADO_animation_finished(anim_name: String) -> void:
    Global.lose()

func _on_Timer_timeout() -> void:
    if !morto:
        Global.win()
