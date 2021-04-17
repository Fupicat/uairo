extends Area2D

onready var player = get_node("../Player")
var speed
var angle

func _ready():
    position = get_node("../Pos").position
    speed = 400 * Global.speed
    angle = get_angle_to(player.position)

func _process(delta):
    position += Vector2(speed * delta, 0).rotated(angle)

func _on_Enemy_area_entered(area):
    if area == player:
        Global.lose()
