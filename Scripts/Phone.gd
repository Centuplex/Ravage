extends Node2D


func _on_OnFullScreen_pressed()->void :
	OS.window_fullscreen = true
	$OnFullScreen.hide()
	$OFFFullScreen.show()


func _on_OFFFullScreen_pressed()->void :
	OS.window_fullscreen = false
	$OnFullScreen.show()
	$OFFFullScreen.hide()

