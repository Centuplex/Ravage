extends RigidBody2D

func _process(delta:float)->void :
	if Global.score <= 100:
		$Proiettile_normale.show()
	
	if Global.score >= 250:
		$pompa.show()
		$Proiettile_normale.hide()
	
	if Global.score >= 600:
		$pompa.hide()
		$Proiettile_normale.show()

	if Global.score >= 1650:
		$Proiettile_normale.hide()
		$Crossbow_dart.show()
		

func _on_Area2D_area_entered(area:Area2D)->void :
	if area.is_in_group("estrazione"):
		print("estrazione")
	else :
		queue_free()

func _on_VisibilityNotifier2D_screen_exited()->void :
	queue_free()
