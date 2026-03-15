extends Node2D

var enemy: = preload("res://Scenes/Enemy.tscn")
var lava = false
export (Array, PackedScene) var zombies
var dannoPlayer = false





func _ready()->void :
	$StartSound.play()
	$Start.play("start")
	randomize()
	$BackroundMusic.play()
	
	if Global.jackal == true:
		$Player / Players / Jackal.show()
	
	if Global.blake == true:
		$Player / Players / Blake.show()
	
	if Global.map == "Zombie_River":
		$Wood.show()
	if Global.map == "LavaBath":
		$LavaBath.show()
	
	if Global.map == "Alcatraz":
		$Bridge_to_Alcatraz_Island.show()
		$Enviroment / Confini / CollisionShape2D.position = Vector2(0, 260)
		$Enviroment / Confini2 / CollisionShape2D.position = Vector2(0, - 138)
		$Enviroment / Spawn1.position = Vector2(1861, 573)
		$Enviroment / Spawn2.position = Vector2(33.5, 320.7)
		$Enviroment / Spawn3.position = Vector2(32.7, 856.6)








func _process(_delta:float)->void :
	randomize()
	$Layer / UI / LifeBar.value = Global.life
	SaveScript.save()

	
	
	








func _on_SpawnRate_timeout()->void :
	randomize()
	var enemy_number = round(rand_range(0, zombies.size() - 1))
	var enemy_instance = zombies[enemy_number].instance()
	enemy_instance.position = $Enviroment / Spawn1.position
	add_child(enemy_instance)



func _on_Area2D_body_entered(body:Node)->void :
	if body.is_in_group("Enemy"):
		dannoPlayer = true
		$DamagePlayer.start()
		Global.life -= rand_range(10, 30)







func _on_SpawnRate2_timeout()->void :
	randomize()
	var enemy_number = round(rand_range(0, zombies.size() - 1))
	var enemy_instance = zombies[enemy_number].instance()
	enemy_instance.position = $Enviroment / Spawn2.position
	add_child(enemy_instance)



func _on_SpawnRate3_timeout()->void :
	randomize()
	var enemy_number = round(rand_range(0, zombies.size() - 1))
	var enemy_instance = zombies[enemy_number].instance()
	enemy_instance.position = $Enviroment / Spawn3.position
	add_child(enemy_instance)

func _on_Restart_timeout()->void :
	get_tree().reload_current_scene()


func _on_Lava_body_entered(body:Node)->void :
	if Global.map == "LavaBath":
		$LavaBath / Timer.start()
		if body.is_in_group("Player"):
			lava = true



func _on_Timer_timeout()->void :
	if lava == true:
		Global.life -= 3
		$LavaBath / Timer.start()
		if Global.life <= 0:
			Global.coin += Global.score
			Global.coin += SaveScript.load_val(Global.coin)
			$Player.hide()
			$Player / Players / Jackal.queue_free()
			$Player / Players / Jackal_2_Hand.queue_free()
			$Player / CollisionShape2D.queue_free()
			$Player / Area2D / CollisionShape2D.queue_free()
			$Restart.start()
			Global.score = 0
			Global.life = 100
			$Restart.start()
			$BackroundMusic.stop()

			
			$AnimationPlayer.play("Dead")
			$Layer / UI / Score.hide()
			$Layer / UI / LifeBar.hide()
			$Layer / UI / cuore.hide()
			$Layer / UI / puntiIcon.hide()
			$Layer / DeathBlack.show()


func _on_Lava_body_exited(body:Node)->void :
	if body.is_in_group("Player"):
		lava = false





func _on_DamagePlayer_timeout()->void :
	if dannoPlayer == true:
		Global.life -= rand_range(10, 30)
		$DamagePlayer.start()
		


		if Global.life <= 0:
			Global.coin += Global.score


			$Player.hide()
			$Player / Players / Jackal.queue_free()
			$Player / Players / Jackal_2_Hand.queue_free()
			$Player / CollisionShape2D.queue_free()
			$Player / Area2D / CollisionShape2D.queue_free()
			$Restart.start()
			Global.score = 0
			Global.life = 100
			$Restart.start()
			$BackroundMusic.stop()

			
			$AnimationPlayer.play("Dead")
			$Layer / UI / Score.hide()
			$Layer / UI / LifeBar.hide()
			$Layer / UI / cuore.hide()
			$Layer / UI / puntiIcon.hide()
			$Layer / DeathBlack.show()
			
			SaveScript.save()

func _on_Area2D_body_exited(body:Node)->void :
	dannoPlayer = false

