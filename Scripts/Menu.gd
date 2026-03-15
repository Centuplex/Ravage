extends Control



func _ready()->void :
	$AudioStreamPlayer.play()
	$Transition.play("nero")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	SaveScript.load_data()




func _on_Setting_pressed()->void :
	$Setting.hide()
	$Setting2.show()
	$Phone / AnimationPlayer.play("Telefono")
func _on_Setting2_pressed()->void :
	$Setting2.hide()
	$Setting.show()
	$Phone / AnimationPlayer.play_backwards("Telefono")


func _on_Exit_pressed()->void :
	get_tree().quit()


func _on_Play_pressed()->void :
	get_tree().change_scene("res://Scenes/MapSelector.tscn")


func _on_Transition_animation_finished(anim_name:String)->void :
	$ColorRect.queue_free()


func _on_openTwitter_pressed()->void :
	OS.window_minimized = true
	OS.shell_open("https://twitter.com/centuplex")


func _on_openInstagram_pressed()->void :
	OS.window_minimized = true
	OS.shell_open("https://instagram.com/centuplex")


func _on_Shop_pressed()->void :
	get_tree().change_scene("res://Scenes/Shop.tscn")






