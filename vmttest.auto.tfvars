// The instance to be used
instance        = "t2.nano"
instance_single = "t2.micro"
/**
  Different amis
*/
amis = {
  windows = "ami-dont_install",
  ubuntu  = "ami-0c55b159cbfafe1f0"
}

ami_type = "ubuntu"

// Test map
test_map = { windows = "ami-dont_install", ubuntu = "ami-0c55b159cbfafe1f0" }

// The number of instances
group_size = 2

// Another number of instances
test_list_size = ["1", "2"]
