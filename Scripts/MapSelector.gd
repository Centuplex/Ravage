extends Node2D


func _ready()->void :

	SaveScript.load_data()
	if Global.buyAlcatraz == true:
		$ColorRect.hide()
	else :
		$ColorRect.show()



	$AudioStreamPlayer.play()
	
func _on_WoodButton_pressed()->void :
	Global.map = "Zombie_River"
	get_tree().change_scene("res://Scenes/Selezione.tscn")




func _on_VulcanoMap_pressed()->void :
	Global.map = "LavaBath"
	get_tree().change_scene("res://Scenes/Selezione.tscn")




func _on_BridgeMap_pressed()->void :
	Global.map = "Alcatraz"
	get_tree().change_scene("res://Scenes/Selezione.tscn")
