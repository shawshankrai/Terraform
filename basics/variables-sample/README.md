<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.sample_res](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.sample_res_new](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content"></a> [content](#input\_content) | n/a | `string` | `"Let there be light"` | no |
| <a name="input_content_boolean"></a> [content\_boolean](#input\_content\_boolean) | n/a | `bool` | `true` | no |
| <a name="input_content_list"></a> [content\_list](#input\_content\_list) | n/a | `list(string)` | <pre>[<br>  "1",<br>  "2",<br>  "3"<br>]</pre> | no |
| <a name="input_content_map"></a> [content\_map](#input\_content\_map) | n/a | `map` | <pre>{<br>  "name": "Rai Kage",<br>  "rank": 1<br>}</pre> | no |
| <a name="input_content_number"></a> [content\_number](#input\_content\_number) | n/a | `number` | `123` | no |
| <a name="input_content_tuple"></a> [content\_tuple](#input\_content\_tuple) | n/a | `tuple([string, bool, number])` | <pre>[<br>  "let there be light",<br>  true,<br>  2<br>]</pre> | no |
| <a name="input_file_name"></a> [file\_name](#input\_file\_name) | n/a | `string` | `"sample.txt"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->