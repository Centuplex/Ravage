extends Control


func _ready()->void :
	randomize()

func _process(delta:float)->void :
	$Score.text = str(Global.score)
