extends Position2D

const ENEMY = preload("res://microgames/fuja/Enemy.tscn")

func _ready():
    $Anim.playback_speed = Global.speed
    $Timer.wait_time = 0.5 / Global.speed
    $Timer.start()

func _on_Timer_timeout():
    $Timer.wait_time = 0.5 / Global.speed
    get_parent().add_child(ENEMY.instance())
    $Timer.start()
