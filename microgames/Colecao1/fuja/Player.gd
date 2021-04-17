extends Area2D

var speed

func _ready():
    speed = 400 * Global.speed
    $Timer.wait_time = 4 / Global.speed
    $Timer.start()

func _process(delta):
    var move
    var lr = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
    var ud = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
    
    move = Vector2(lr, ud)
    move = move.normalized()
    
    position += move * speed * delta

func _on_Timer_timeout():
    Global.win()
