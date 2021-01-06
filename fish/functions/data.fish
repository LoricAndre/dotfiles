function data
  set pid (pgrep openvpn)
  if set -q pid
    read -n 1 "VPN is running. Terminate ?[Y/n] " k
    switch $k
      case y Y ''
        sudo kill "$pid"
      case n N
        echo "VPN left running."
    end
  else
    echo "Launching ovpn"
    sudo openvpn --config "$HOME/projects/data.ovpn" --daemon
  end
end

