@tool
extends MeshInstance3D

@export var update = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_mesh()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if update:
		generate_mesh()
		update = false
		
	
func generate_mesh() -> void:
	var st := SurfaceTool.new()

	st.begin(Mesh.PRIMITIVE_TRIANGLES)

	st.set_uv(Vector2(0, 0))
	st.add_vertex(Vector3(-1, -1, 0))
	st.set_uv(Vector2(0, 1))
	st.add_vertex(Vector3(-1,  1, 0))
	st.set_uv(Vector2(1, 1))
	st.add_vertex(Vector3( 1,  1, 0))
	st.set_uv(Vector2(1, 0))
	st.add_vertex(Vector3( 1, -1, 0))

	st.add_index(0)
	st.add_index(1)
	st.add_index(2)
	
	st.add_index(2)
	st.add_index(3)
	st.add_index(0)

	st.generate_normals()
	st.generate_tangents()
	
	mesh = st.commit()
