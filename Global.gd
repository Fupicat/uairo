extends Node

const BOSS = 4

var lives = 4
var speed = 1
var level = 0

enum states {
    INTRO,
    WIN,
    LOSE
   }

var state = states.INTRO

func win():
    state = states.WIN
    # warning-ignore:return_value_discarded
    get_tree().change_scene("res://Intermissao.tscn")

func lose():
    state = states.LOSE
    lives -= 1
    if lives == 0:
        get_tree().quit()
    # warning-ignore:return_value_discarded
    get_tree().change_scene("res://Intermissao.tscn")
