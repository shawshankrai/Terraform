resource "local_file" "sample_res" {
  filename = var.file_name
  content = var.content_tuple[1]
}

resource "local_file" "sample_res_new" {
  filename = "naruto.txt"
  content = var.content_map["name"]
}