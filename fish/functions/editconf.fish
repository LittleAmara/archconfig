function editconf --wraps='sudo -e /etc/nixos/configuration.nix' --description 'alias editconf=sudo -e /etc/nixos/configuration.nix'
  sudo -e /etc/nixos/configuration.nix $argv; 
end
