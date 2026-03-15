extends KinematicBody2D


var life: = 75
var enemy: = self
var motion: = Vector2()
var enemySpeed: = 100

var blood = preload("res://Scenes/Blood.tscn")

var stun = false

func _ready()->void :
	randomize()



func _physics_process(delta:float)->void :
	$LifeBar.value = life
	var Player = get_parent().get_node("Player")
	
	
	
	if stun == false:
		motion = global_position.direction_to(Player.global_position)

	elif stun == true:
		motion = lerp(motion, Vector2(0, 0), 2)

	global_position += motion * delta * enemySpeed
	
	$Sprite.look_at(Player.position)
	move_and_slide(motion)


func _on_Area2D_body_entered(body:Node)->void :
	if body.is_in_group("Bullet"):
		$Sprite.modulate = Color.red
		stun = true
		$Stun.start()
		life -= Global.gun_damage
		$Dead2.play()



		if life <= 0:
			randomize()
			Global.killedZombie += 1
			var Player = get_parent().get_node("Player")
			var blood_instance = blood.instance()
			get_tree().current_scene.add_child(blood_instance)
			blood_instance.global_position = global_position
			blood_instance.rotation = global_position.angle_to_point(Player.global_position)
			$Dead.play()
			$Die.start()
			$Sprite.hide()
			$Area2D.queue_free()
			$CollisionShape2D.queue_free()
			$LifeBar.hide()


func _on_Die_timeout()->void :
	queue_free()
	Global.score += int(rand_range(15, 45))



func _on_Stun_timeout()->void :
	$Sprite.modulate = Color.white
	stun = false
