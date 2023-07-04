install:
	nix develop -c nixos-rebuild switch --use-remote-sudo --impure --flake . -L
	nix develop -c home-manager switch --flake .

boot:
	nixos-rebuild boot --use-remote-sudo --impure --flake . -L

test:
	nixos-rebuild test --use-remote-sudo --impure --flake . -L

update:
	nix flake update

upgrade:
	make update && make install