extends Node2D

func _ready()->void :
	$bgmusic.play()

func _process(delta:float)->void :
	$coin.text = str(Global.coin) + "  ZC"
	SaveScript.save()


func _on_BuyMapAlcatraz_pressed()->void :
	if Global.coin >= 15000:
		Global.coin -= 15000
		Global.buyAlcatraz = true
	else :
		$Insufficient.show()
		$Timer.start()



func _on_BuyBlake_pressed()->void :
	if Global.coin >= 6500:
		Global.coin -= 6500
		Global.buyBlake = true
	else :
		$Insufficient.show()
		$Timer.start()



func _on_Timer_timeout()->void :
	$InsufficientAnim.play("insufficienti")


func _on_InsufficientAnim_animation_finished(anim_name:String)->void :
	$Insufficient.hide()



func _on_Back_pressed()->void :
	get_tree().change_scene("res://Scenes/Menu.tscn")



