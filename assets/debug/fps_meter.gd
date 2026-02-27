extends Label 
class_name FPSMeter
func _process(delta: float) -> void:
	text = str(float(1/delta))
