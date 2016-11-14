# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir [file dirname [info script]]

#create project
create_project interposer_tester $origin_dir/interposer_tester -part xc7a100tfgg676-1

# Create block design
source $origin_dir/src/bd/interposer_tester.tcl

# Generate the wrapper
set design_name [get_bd_designs]
make_wrapper -files [get_files $design_name.bd] -top -import

