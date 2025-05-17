# Paddle.gd
extends Area2D

@export var speed = 300 # Możesz dostosować w inspektorze
@export var player_id: int
var screen_height # Przechowamy wysokość ekranu

func _ready():
	screen_height = get_viewport_rect().size.y

func _process(delta):
	var input_direction = 0
	# Domyślne mapowania dla up/down (możesz zmienić w Ustawienia Projektu -> Mapa Wprowadzania)
	# Załóżmy, że lewa paletka to "ui_up" i "ui_down"
	if player_id == 1:
		if Input.is_action_pressed("ui_up_player1"): # Zdefiniuj "ui_up_player1" w Mapa Wprowadzania
			input_direction = -1
		if Input.is_action_pressed("ui_down_player1"): # Zdefiniuj "ui_down_player1" w Mapa Wprowadzania
			input_direction = 1

	position.y += input_direction * speed * delta

	# Ograniczenie ruchu do granic ekranu
	var paddle_height = $ColorRect.size.y # Zakładamy, że ColorRect to rozmiar paletki
	position.y = clamp(position.y, paddle_height / 2, screen_height - paddle_height / 2)
