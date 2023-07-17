#https://www.tinfoilcipher.co.uk/2020/10/19/terraform-tricks-working-with-timestamps/
locals {
    current_timestamp  = timestamp()
    current_day        = formatdate("YYYY-MM-DD", local.current_timestamp)
    tomorrow           = timeadd(local.current_timestamp, "24h")
    tommorw_format     = formatdate("YYYY-MM-DD", local.tomorrow)
}

output "tomorrow" {
    value = local.tomorrow
}
output "current_day" {
    value = local.current_day
}
output "tomorrow_format" {
    value = local.tommorw_format
}
