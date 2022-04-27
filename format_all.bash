#!/bin/bash
root_dir=$(pwd)

echo "Formatting ${root_dir}/src/ros_proseco_planning/"
cd ${root_dir}/src/ros_proseco_planning/
find . -regex '.*\.\(cpp\|h\)' -exec clang-format -style=file -i {} \;
find . -regex '.*\.\(py\)' -exec black {} \;

echo "Formatting ${root_dir}/src/proseco_planning/src"
cd ${root_dir}/src/proseco_planning/src
find . -regex '.*\.\(cpp\|h\)' -exec clang-format -style=file -i {} \;
echo "Formatting ${root_dir}/src/proseco_planning/include"
cd ${root_dir}/src/proseco_planning/include
find . -regex '.*\.\(cpp\|h\)' -exec clang-format -style=file -i {} \;
find . -regex '.*\.\(py\)' -exec black {} \;