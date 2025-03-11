extends Label

func _ready() -> void:
	self.text = "Coins:"+ str($"../..".money)
