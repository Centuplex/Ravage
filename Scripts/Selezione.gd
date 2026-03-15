extends Node2D

func _ready()->void :
	if Global.buyBlake == true:
		$Blake.disabled = false
		$BlakeLocked.hide()
	else :
		$Blake.disabled = true
		$BlakeLocked.show()
	
	
	
	
	$AudioStreamPlayer.play()
	
	if Global.map == "Zombie_River":
		$Wood.show()
	
	if Global.map == "LavaBath":
		$Stage_Vulcano.show()
	
	if Global.map == "Alcatraz":
		$Bridge_to_Alcatraz_Island.show()

func _on_Jackal_pressed()->void :
	Global.jackal = true
	get_tree().change_scene("res://Scenes/World.tscn")




func _on_Blake_pressed()->void :
	
		Global.blake = true
		get_tree().change_scene("res://Scenes/World.tscn")

