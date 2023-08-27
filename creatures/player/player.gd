extends CharacterBody2D
class_name Player

enum Dir {
    LEFT, RIGHT, UP, DOWN
}

const WALK_SPEED := 50.0

@onready var _sprite := $sprite as AnimatedSprite2D

var _last_dir := Dir.DOWN


func _physics_process(_delta: float) -> void:
    var vector := Input.get_vector("left", "right", "up", "down")

    velocity = vector * WALK_SPEED

    if abs(vector.x) > abs(vector.y):
        # right or left
        if vector.x > 0:
            _sprite.play("walk_right")
            _last_dir = Dir.RIGHT
        else:
            _sprite.play("walk_left")
            _last_dir = Dir.LEFT
    else:
        # down or right
        if vector.y > 0:
            _sprite.play("walk_down")
            _last_dir = Dir.DOWN
        else:
            _sprite.play("walk_up")
            _last_dir = Dir.UP

    if is_zero_approx(vector.length()):
        match _last_dir:
            Dir.LEFT:
                _sprite.play("idle_left")
            Dir.RIGHT:
                _sprite.play("idle_right")
            Dir.UP:
                _sprite.play("idle_up")
            Dir.DOWN:
                _sprite.play("idle_down")

    move_and_slide()
