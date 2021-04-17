extends Area2D

func _ready():
    $Timer.wait_time = rand_range(0, 1)

func _on_Timer_timeout() -> void:
    $AnimationPlayer2.play("drive")

func _on_car_area_entered(area: Area2D) -> void:
    $Timer.stop()
    $AnimationPlayer2.stop()
