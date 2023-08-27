extends Node


func _ready() -> void:
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("exit"):
        get_tree().quit()
    elif event.is_action_pressed("restart"):
        get_tree().reload_current_scene()
