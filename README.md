# Visual Studio Code Workspace for ProSeCo Planning

This Visual Studio Code workspace is convenient for working with the ProSeCo Planning project. However, if you want to use a different IDE it is still advisable to use this workspace as a top-level folder of the ROS project.

## Setup

```bash
git clone --recurse-submodules --shallow-submodules https://github.com/ProSeCo-Planning/proseco_workspace.git
```

Once the project is cloned, the workspace can be opened with VS Code:

```bash
code ./proseco_workspace/proseco.code-workspace
```

### Docker Setup (recommended)

#### Install Docker

Install Docker for Windows, Mac, or Linux (https://docs.docker.com/get-docker/)

#### Start the Docker Container

```bash
docker run -dit --restart unless-stopped --name proseco -p 8050:8050 --mount type=bind,source="$(pwd)"/proseco_workspace,target=/proseco_workspace karlkurzer/proseco:devel
```

#### Attach to the Docker

Either using `docker attach proseco` or Visual Studio Code (https://code.visualstudio.com/docs/remote/attach-container).

### Local Setup

#### Requirements

- Ubuntu 20.04 (Focal)
- ROS Noetic Ninjemys
- Python 3.8
- python3-pip
- libeigen3
- libcairo2-dev
- swig4.0

## Commands

### Build

Navigate to the `proseco_workspace` directory and run the following command to build the project.

```bash
. /opt/ros/noetic/setup.sh && catkin_make_isolated --cmake-args -DCMAKE_BUILD_TYPE=RELEASE -DPROSECO_RUN_TEST=ON -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python3
```

### Install Python Package

Navigate to the `proseco_workspace/src/ros_proseco_planning/python` directory and run the following command to install the ProSeCo Python package.

```bash
pip3 install -e .
```

### Source

Navigate to the `proseco_workspace` directory and run the following command to source the project.

```bash
. ./devel_isolated/setup.bash
```

### Evaluate

Navigate to the `proseco_workspace/src/ros_proseco_planning/python` directory and run the following command to evaluate the ProSeCo planner on a specific config. _Note a roscore needs to be running `roscore`_

```bash
python3 proseco/evaluator/evaluator.py -c config.json -y
```

### Visualize

Navigate to the `proseco_workspace/src/ros_proseco_planning/python` directory and run the following command to launch a dashboard (http://localhost:8050) to inspect the results from the evaluation of the ProSeCo planner on a specific config.

```bash
python3 proseco/dashboard/index.py
```

### Configured Tasks (VS Code)

The most important tasks are configured at `.vscode/tasks.json`.

### Configured Debugging (VS Code)

The debugging tasks are configured at `.vscode/launch.json`.
