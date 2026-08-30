set script_dir [file dirname [file normalize [info script]]]
set project_dir [file join $script_dir vivado_project]

create_project -force GPT2_WANG_QICHEN_536 $project_dir -part xc7a35tcpg236-1
set_property target_language Verilog [current_project]

add_files [glob [file join $script_dir src *.v]]
add_files -fileset sim_1 [file join $script_dir sim tb_gpt2_device.v]

set_property top gpt2_device [get_filesets sources_1]
set_property top tb_gpt2_device [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "Project created at $project_dir"
puts "Select A, B, pb, S, an, and seg only, then use Unsigned Decimal radix."
launch_simulation
run 200 ns
