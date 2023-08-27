extends Node2D

@onready var _tiles := $tilemap as TileMap


func _ready() -> void:
    var cam := get_tree().root.get_camera_2d()

    var limits := _tiles.get_used_rect() as Rect2
    var size := _tiles.tile_set.tile_size as Vector2
    var offset := _tiles.global_position
    var limit_left := int(limits.position.x * size.x) + int(offset.x)
    var limit_top := int(limits.position.y * size.y) + int(offset.y)
    var limit_right := int(limits.end.x * size.x) + int(offset.x)
    var limit_bottom := int(limits.end.y * size.y) + int(offset.y)

    cam.limit_left = limit_left
    cam.limit_top = limit_top
    cam.limit_right = limit_right
    cam.limit_bottom = limit_bottom
