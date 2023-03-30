resource "local_file" "sample_res" {
  filename = "sample.txt"
  sensitive_content = "Let there be light"
  file_permission = "0700"
}