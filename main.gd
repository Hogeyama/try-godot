extends Node

@export var mob_scene: PackedScene
var score


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_hud_start_game() -> void:
	new_game()

func _on_player_hit() -> void:
	game_over()

func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()

func _on_mob_timer_timeout() -> void:
	add_random_mob()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	JavaScriptBridge.eval("""
		alert("Game Over. Score {score}");
	""".format({"score": score}), true)

func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$Music.play()
	get_tree().call_group("mobs", "queue_free")

func add_random_mob():
	# 新しいMobインスタンスを生成。
	var mob = mob_scene.instantiate()

	# Path2D上の適当な点を取る。
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# 取った適当な点をMobの初期位置にする。
	mob.position = mob_spawn_location.position

	# Mobがフィールドを横切るように向ける〜ランダム補正を添えて〜。
	var direction = mob_spawn_location.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# 速度もランダムに決める。
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# メインシーンに追加する。
	add_child(mob)
