data local_file datasource {
  filename = "sample.txt"
}

output datasource_output {
  value = data.local_file.datasource.content
}