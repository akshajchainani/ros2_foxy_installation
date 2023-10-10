
# Configure locale
locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale

# Add ROS 2 repository
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Update and upgrade system
sudo apt update
sudo apt upgrade -y

# Install ROS 2 Foxy desktop package, URDF, Gazebo, and additional packages if needed
sudo apt install ros-foxy-desktop ros-foxy-gazebo-* ros-foxy-navigation -y

# Create a ROS 2 workspace
mkdir -p ~/ros2_workspace/src
cd ~/ros2_workspace
colcon build

# Add ROS 2 setup to .bashrc
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc

# Source the .bashrc to apply changes
source ~/.bashrc
