extends Node2D


func _ready()->void :
	$AnimationPlayer.play("presenta")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_AnimationPlayer_animation_finished(anim_name:String)->void :
	$AnimationPlayer.play_backwards("presenta")
	$CentuplexLogoHorror.hide()
	$CanvasLayer / ravage.show()
	$CanvasLayer / CanvasLayer / ColorRect.show()
	$Timer.start()


func _on_Timer_timeout()->void :
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _input(event:InputEvent)->void :
	if Input.is_action_just_pressed("skippa"):
		get_tree().change_scene("res://Scenes/Menu.tscn")
