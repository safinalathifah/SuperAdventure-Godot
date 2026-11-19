extends CharacterBody2D

@export var speed: float = 250.0
@export var jump_velocity: float = -400.0
@export var max_jumps: int = 2

var jump_count: int = 0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# 1. Gravitasi & Reset kuota lompat saat menyentuh lantai
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0

	# 2. Double Jump (pakai action "Lompat" -> Spasi)
	if Input.is_action_just_pressed("Lompat") and jump_count < max_jumps:
		velocity.y = jump_velocity
		jump_count += 1

	# 3. Gerak Kiri & Kanan (pakai action "Jalan_Kiri" -> A, "Jalan_kanan" -> D)
	var direction := Input.get_axis("Jalan_Kiri", "Jalan_kanan")
	if direction != 0:
		velocity.x = direction * speed
		anim.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	# 4. Eksekusi gerakan
	move_and_slide()

	# 5. Update animasi ("idle", "lari", "lompat")
	update_animation(direction)

func update_animation(direction: float) -> void:
	if not is_on_floor():
		anim.play("lompat")
	elif direction != 0:
		anim.play("lari")
	else:
		anim.play("idle")
