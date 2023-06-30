HOSTNAME = $(shell hostname)
USERNAME = $(shell whoami)

NIX_FILES = $(shell find . -name '*.nix' -type f)

ifndef HOSTNAME
	$(error Hostname unknown)
endif

install:
	nixos-rebuild switch --use-remote-sudo --impure --flake . -L
	home-manager switch --flake .

boot:
	nixos-rebuild boot --use-remote-sudo --impure --flake .#${HOSTNAME} -L

test:
	nixos-rebuild test --use-remote-sudo --impure --flake .#${HOSTNAME} -L

update:
	nix flake update

upgrade:
	make update && make install