terraform {
  required_providers {
    hyperv = {
      source  = "taliesins/hyperv"
      version = ">= 1.0.3"
    }
  }
}

provider "hyperv" {
  https    = false
  insecure = true
  port     = 5985
  user     = "<USER>"
  password = "<PASSWORD>"
  host     = "127.0.0.1"
  use_ntlm = false
}


resource "hyperv_machine_instance" "default" {
  count                                   = 3
  name                                    = "Ubn-K8s-N${count.index}"
  generation                              = 1
  automatic_critical_error_action         = "None"
  automatic_critical_error_action_timeout = 30
  automatic_start_action                  = "Nothing"
  automatic_start_delay                   = 0
  automatic_stop_action                   = "Shutdown"
  checkpoint_type                         = "Disabled"
  #dynamic_memory = false
  guest_controlled_cache_types = false
  high_memory_mapped_io_space  = 536870912
  lock_on_disconnect           = "Off"
  memory_startup_bytes         = 4294967296
  notes                        = "Kubernetes Node ${count.index}"
  processor_count              = 2
  static_memory = true
  state         = "Running"

  # Configure integration services
  integration_services = {
    "Guest Service Interface" = false
    "Heartbeat"               = true
    "Key-Value Pair Exchange" = true
    "Shutdown"                = true
    "Time Synchronization"    = true
    "VSS"                     = true
  }

  # Create a network adaptor
  network_adaptors {
    name                 = "External"
    switch_name          = "External"
    management_os        = false
    is_legacy            = false
    dynamic_mac_address  = true
    mac_address_spoofing = "Off"
    device_naming        = "Off"
  }

  # Create dvd drive
  dvd_drives {
    controller_number   = "0"
    controller_location = "1"
    path                = "d:/iso/ubuntu-22.04.2-live-server-amd64.iso"
  }

  # Create a hard disk drive
  hard_disk_drives {
    controller_type     = "Ide"
    controller_number   = "0"
    controller_location = "0"
    path                = "D:/VMs/Ubn-K8s-N${count.index}.vhd"
  }
}
