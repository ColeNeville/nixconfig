let
  cole = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILkfxISoKJYsH4sm7am8r46l6D0jyDq1IvRYVl1ax1JF";
  users = [cole];

  garuda = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGqevjPiWB7qR+84Eg4hX+Y6SWektcwNVqXuWpWZyHvN";
  systems = [garuda];
in {
  "secrets/secret1.age".publicKeys = [cole garuda];
}
