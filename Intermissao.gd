extends Node2D

var minigames = ["res://Miniteste.tscn", "res://microgames/micro_1/micro_1.tscn"]
const BOSS = "res://Bossteste.tscn"

func _ready():
    update()
    
    match Global.state:
        Global.states.INTRO:
            $Anim.play("Intro")
        Global.states.WIN:
            $Anim.play("Win")
        Global.states.LOSE:
            $Anim.play("Lose")
    yield($Anim, "animation_finished")
    
    if Global.level % Global.BOSS == 0 and Global.level != 0: # Se o nível anterior foi um boss
        Global.speed += 0.1
    
    $Anim.play("Next")
    Global.level += 1
    update()
    yield($Anim, "animation_finished")
    
    if Global.level % Global.BOSS == 0: # Se o nível atual foi um boss
        # warning-ignore:return_value_discarded
        get_tree().change_scene(BOSS)
    else:
        minigames.shuffle()
        # warning-ignore:return_value_discarded
        get_tree().change_scene(minigames[0])

func update():
    $Round.text = str(Global.level)
    $Lives.text = "Vidas: " + str(Global.lives)
    $Anim.playback_speed = Global.speed
    $Music.pitch_scale = Global.speed
