extends KinematicBody2D


var speed: = 200
var normal_speed: = 200
var velocity: = Vector2.ZERO
var can_shoot: = true
var timer = true
var run_speed: = 400
var can_run = true
var bullet: = preload("res://Scenes/Bullet.tscn")
var bullet_speed: = 2000






var glock = true
var pompa = false
var mitra = false
var xm4 = false
var crossbow = false




var passi = false


var estrazione = false
var scomparire = false
var suono = false
var giaChiamata = false



func _ready()->void :
	randomize()

func _process(delta:float)->void :
	if Global.score <= 250:
		if glock == true:
			Global.gun_damage = 25
			$Guns / Glock_17.show()

	if Global.score >= 250:
		
		glock = false
		pompa = true

		if pompa == true:
			if Global.jackal == true:
				$Players / Jackal.hide()
				$Players / Jackal_2_Hand.show()
			
			if Global.blake == true:
				$Players / Blake.hide()
				$Players / Blake_2_Hands.show()





			$Delay.wait_time = 2.0
			Global.gun_damage = 37.5
			$Guns / Glock_17.hide()
			$Guns / Doppietta_a_canne_mozze.show()


	if Global.score >= 600:
		if Global.jackal == true:
			$Players / Jackal_2_Hand.hide()
			$Players / Jackal.show()


		if Global.blake == true:
			$Players / Blake.show()
			$Players / Blake_2_Hands.hide()


		pompa = false
		mitra = true
		if mitra == true:
			$Delay.wait_time = 0.4
			$Guns / Mac101.show()
			$Guns / Doppietta_a_canne_mozze.hide()
			Global.gun_damage = 15




	if Global.score >= 1000:
		if Global.jackal == true:
			$Players / Jackal_2_Hand.show()
			$Players / Jackal.hide()
		
		if Global.blake == true:
			$Players / Blake.hide()
			$Players / Blake_2_Hands.show()


		$Laser.position = Vector2(107.54, 19.574)
		mitra = false
		xm4 = true
		if xm4 == true:
			$Delay.wait_time = 0.2
			$Guns / XM4.show()
			$Guns / Mac101.hide()
			Global.gun_damage = 9



	if Global.score >= 1650:
		if Global.jackal == true:
			$Players / Jackal.show()
			$Players / Jackal_2_Hand.hide()
		if Global.blake == true:
			$Players / Blake.show()
			$Players / Blake_2_Hands.hide()

		$Laser.hide()
		xm4 = false
		crossbow = true
		if crossbow == true:
			$Delay.wait_time = 2.5
			$Guns / XM4.hide()
			$Guns / Crossbow.show()
			Global.gun_damage = 75



func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("estrazione"):
		pass




	
		
			
			
			
			
			
			





	
		
	
		

	if Input.is_action_just_pressed("estrazione"):
		if estrazione == true:
			if giaChiamata == false:
				$JetEstrazione.play("jet")
				$jetSound.play()
				Global.coin += Global.score

				scomparire = true
				suono = true
				giaChiamata = true




	if Input.is_action_pressed("shoot"):
		if can_shoot == true:
			
			$Guns / GlockAnim.play("glock")
			$Guns / DoppiettaAnim.play("Pompa")
			$Guns / MacAnim.play("Mac")
			$Guns / Xm4Anim.play("xm4")
			$Guns / CrossbowAnim.play("crossbow")



			if Global.score <= 250:
				if glock == true:
					$GunShot.play()





			if Global.score >= 250:
				if pompa == true:
					$Shotgun.play()
				
				if mitra == true:
					$Mac.play()

				if xm4 == true:
					$xm4.play()
				
				if crossbow == true:
					$balestra.play()






			var bullet_instance = bullet.instance()
			bullet_instance.position = $Muzzle.global_position
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
			get_tree().get_root().call_deferred("add_child", bullet_instance)
			can_shoot = false
			$Delay.start()


	velocity = velocity.normalized() * speed

func _physics_process(delta:float)->void :
	get_input()
	velocity = move_and_slide(velocity)
	look_at(get_global_mouse_position())

func _on_Timer_timeout()->void :
	can_shoot = true

func _on_Estrazione_body_entered(body:Node)->void :
	if body.is_in_group("Player"):
		estrazione = true
		$CanvasLayer / extraction.show()



func _on_Estrazione_body_exited(body:Node)->void :
	estrazione = false
	$CanvasLayer / extraction.hide()


func _on_Sparire_body_entered(body:Node)->void :
	if scomparire == true:
		
		$Players.hide()
		$CollisionShape2D.hide()
		$Area2D.hide()
		$Guns.hide()
		$Laser.hide()
		$EstrazioneCompletata.play("neroestrazione")



func _on_EstrazioneCompletata_animation_finished(anim_name:String)->void :
	Global.score = 0
	Global.life = 100
	SaveScript.save()
	get_tree().change_scene("res://Scenes/Menu.tscn")



func _on_lentezza_body_entered(body:Node)->void :
	if Global.map == "Zombie_River":
		if body.is_in_group("Player"):
			speed = 100


func _on_lentezza_body_exited(body:Node)->void :
	if body.is_in_group("Player"):
		speed = 200


func _on_FootstepsTimer_timeout()->void :
	passi = true
