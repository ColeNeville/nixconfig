install:
	nix develop . -c nixos-rebuild switch --use-remote-sudo --flake . -L
	nix develop . -c home-manager switch --flake .

boot:
	nixos-rebuild boot --use-remote-sudo --impure . -L

test:
	nixos-rebuild test --use-remote-sudo --impure . -L

update:
	nix flake update

upgrade:
	make update && make install