extends CharacterBody2D

#variavel mpara aarmazenar a velocidade do player
const gravidade = 10
const speed = 160
var jump_force = -200

@onready var sprite = $AnimatedSprite2D #definir as sprites

func _ready():
	pass 

func _process(delta):
	pass
	
func _physics_process(delta):
	movimentar_player()
	
func movimentar_player() -> void:
#movimentar horizontal
	
#is action pressed = verifica se alguma açao foi pressionada
#(escolher o input)
	if Input.is_action_pressed("mv_direito"):
		velocity.x = speed #esta variavel ganhara o valo de 1
		sprite.play("samuraiRun")
		sprite.flip_h = false #nao flipa o sprite
	elif Input.is_action_pressed("mv_esquerdo"):
		velocity.x = -speed
		sprite.play("samuraiRun")
		sprite.flip_h = true #flipa a sprite quando anda p esquerda
	else:
		velocity.x = 0
		sprite.play("idle")
		
#movimentar vertical 
	if !is_on_floor():
		velocity.y += gravidade
	if Input.is_action_just_pressed("pulo") and is_on_floor():
		velocity.y = jump_force
	
	if velocity.y > 0 and !is_on_floor():
		sprite.play("fall")
	elif velocity.y < 0 and !is_on_floor():
		sprite.play("jump")

	move_and_slide() #pega a velocity do CB2D e moviemnta baseado nela
	
	
	
















