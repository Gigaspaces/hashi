data_dir = "/etc/nomad.d"
log_level = "DEBUG"

plugin "raw_exec" {
  config {
    enabled = true
  }
}

telemetry {
  publish_allocation_metrics = true
  publish_node_metrics       = true
  prometheus_metrics         = true
}