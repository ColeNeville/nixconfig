install:
	nix develop --extra-experimental-features "nix-command flakes" . -c nixos-rebuild switch --use-remote-sudo --flake . -L

boot:
	nixos-rebuild boot --use-remote-sudo --impure . -L

test:
	nix develop --extra-experimental-features "nix-command flakes" . nixos-rebuild test --use-remote-sudo --flake . -L

update:
	nix flake update

upgrade:
	make update && make install