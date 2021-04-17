extends KinematicBody2D

var gravity = 300

func _input(Event):
    if Event.is_action_pressed("ui_up"):
        
