extends Node

var save_path = "user://Ravage.dat"

func _ready()->void :
	load_data()



func save():
	var data = {
		"Coin":Global.coin, 
		"BuyBlake":Global.buyBlake, 
		"BuyAlcatraz":Global.buyAlcatraz
	}
	
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()


func load_data():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			Global.coin = player_data["Coin"]
			Global.buyBlake = player_data["BuyBlake"]
			Global.buyAlcatraz = player_data["BuyAlcatraz"]
			file.close()
			print(player_data)
	print("CARICO")
