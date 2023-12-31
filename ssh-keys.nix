let
in {
  users = {
    "cole@garuda" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIIps44FXy2zI1F4nU8zYFP/Sv04L3+ZnoSAk/PoWSIr";
    "cardno:24_733_178" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKsrXiGWbX/y88AVjIca34xGv6Wm6RPgqhrpn8PG02yQ";
  };

  hosts = {
    alexander = {
      ecdsa = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBPEOv1kKrY6fbR4blcBjtnrjL4sdlvqC7mSnISnSurh9NrI3tsR07vXUONzXOBvVTGkMFI1g8n0IZdQykZAbj20=";
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPyBTquw9ZY605HZ+yZY2mJxuD9VPITBGwBXbyoUEwHd";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgeepLDyn8jYDHUqG9T9D/CpGgUtKPNTJxvZ4Q1h4Qr/LbhuC1BSrdXN9iYNcv4hJ37DPaaQWJxpYM2fikvtdEMLaipHr5ffU6zrpQ3FZe+2ZvvMpPIkuRBu978rCvbj3qvoD6Rbc4vo0X/UcmCl7yavZcEOUL46WvEYPzu9TtBhucrAuwfFsjZtuqzzTdCsMQ2SPsjEVNxEP2AZkC9gCpCQrmjhZBv/DYWaZUKxoD7TpZoKwS4rk59vmkch5noNYpvNbq2turVNN3vzzCl8+DZCca2XTU7Ccpem0eU+JwDwG0OsFJZVyRZfOiBb3pRSSmg4a8HzKOhxWi9kIo7QxhYhYqd3Mq2N8oeYUV+YHxGl2fy2r59o7YDtJQfnhGni6Y4xdpmo/YCuZxkfN9URARRQ0+mIwZ07HUv/XmdFgeoX3hgiurNdmriVE1xqpqdCx80Z9ueC8TUua7gn3/ZZ1m4Dea9ps7/bzMntkTN5EZ5kSjUS0jstrt5YksO5s5NFk=";
    };
    alexander-1 = {
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINAH+9iIQGZJA4C9xJeh3gZvGGy5vsAkvB5m4Fk01lT6";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCY/9Pvp1hwhWd9JJX6HiZmhDgHknEYKJv6NxoB2LmhG38oVa8pzzg3dBSGXSe0FVqRe0PJ0cqd7eMV7IjRDXgCpWKsAbL+zC+d9g7syINJiCAXu+EKu8PZWsSTtgocqkBWj53C6UW55W5EG9vuFP2QdW2Og+4WWjOu8V754m3icRnKCrVAupC8Ocr8pNEVchFZ2NXpqx90EdYtt8TUS4tVl+X0YlyzEs4TwlIQyJzLKcLKx8k7daqY9PlKAdgwBoXiDg4rBfozfETAL0elJmVgDOX7FRQVp2GkS0jjvLQivMu7rzrEp3q42X3HdE6Q76t5jhTrjNEQYqqjDGL8nu9HdGRpctvj9R2/KahdD8z3Iu9u0EmDdJxgzMtG0W7aZp8ViRa1lo3eTtwkV6H35iAFxjWb3h3ieF2208ojXtMh8U30EnxkZx4jKKwxIVWZWU61TmsN50NTB5bb4iHQoctbwA1pLVJKQhJ23vtUCsR4b04RkEOrwDW9C2aW0HaXgrRJhg/HXreWxl0rY+fkgWRjTjbEA20ByeZ2/qjEoe8eYgALsDoJnPqtRS/BWOt/jf/YRRxfetGkwsT+2nUxLT8Bnw/kF7L5hy3vG4SdkyyQCncJ3BuPljaYdbSxsY+xMawbwpAFLwgHaeZYvzYkAWBdXL4eO2HfiCOxA7Pe7YTQLw==";
    };
    alexander-2 = {
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINAH+9iIQGZJA4C9xJeh3gZvGGy5vsAkvB5m4Fk01lT6";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCY/9Pvp1hwhWd9JJX6HiZmhDgHknEYKJv6NxoB2LmhG38oVa8pzzg3dBSGXSe0FVqRe0PJ0cqd7eMV7IjRDXgCpWKsAbL+zC+d9g7syINJiCAXu+EKu8PZWsSTtgocqkBWj53C6UW55W5EG9vuFP2QdW2Og+4WWjOu8V754m3icRnKCrVAupC8Ocr8pNEVchFZ2NXpqx90EdYtt8TUS4tVl+X0YlyzEs4TwlIQyJzLKcLKx8k7daqY9PlKAdgwBoXiDg4rBfozfETAL0elJmVgDOX7FRQVp2GkS0jjvLQivMu7rzrEp3q42X3HdE6Q76t5jhTrjNEQYqqjDGL8nu9HdGRpctvj9R2/KahdD8z3Iu9u0EmDdJxgzMtG0W7aZp8ViRa1lo3eTtwkV6H35iAFxjWb3h3ieF2208ojXtMh8U30EnxkZx4jKKwxIVWZWU61TmsN50NTB5bb4iHQoctbwA1pLVJKQhJ23vtUCsR4b04RkEOrwDW9C2aW0HaXgrRJhg/HXreWxl0rY+fkgWRjTjbEA20ByeZ2/qjEoe8eYgALsDoJnPqtRS/BWOt/jf/YRRxfetGkwsT+2nUxLT8Bnw/kF7L5hy3vG4SdkyyQCncJ3BuPljaYdbSxsY+xMawbwpAFLwgHaeZYvzYkAWBdXL4eO2HfiCOxA7Pe7YTQLw==";
    };
    alexander-3 = {
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINAH+9iIQGZJA4C9xJeh3gZvGGy5vsAkvB5m4Fk01lT6";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCY/9Pvp1hwhWd9JJX6HiZmhDgHknEYKJv6NxoB2LmhG38oVa8pzzg3dBSGXSe0FVqRe0PJ0cqd7eMV7IjRDXgCpWKsAbL+zC+d9g7syINJiCAXu+EKu8PZWsSTtgocqkBWj53C6UW55W5EG9vuFP2QdW2Og+4WWjOu8V754m3icRnKCrVAupC8Ocr8pNEVchFZ2NXpqx90EdYtt8TUS4tVl+X0YlyzEs4TwlIQyJzLKcLKx8k7daqY9PlKAdgwBoXiDg4rBfozfETAL0elJmVgDOX7FRQVp2GkS0jjvLQivMu7rzrEp3q42X3HdE6Q76t5jhTrjNEQYqqjDGL8nu9HdGRpctvj9R2/KahdD8z3Iu9u0EmDdJxgzMtG0W7aZp8ViRa1lo3eTtwkV6H35iAFxjWb3h3ieF2208ojXtMh8U30EnxkZx4jKKwxIVWZWU61TmsN50NTB5bb4iHQoctbwA1pLVJKQhJ23vtUCsR4b04RkEOrwDW9C2aW0HaXgrRJhg/HXreWxl0rY+fkgWRjTjbEA20ByeZ2/qjEoe8eYgALsDoJnPqtRS/BWOt/jf/YRRxfetGkwsT+2nUxLT8Bnw/kF7L5hy3vG4SdkyyQCncJ3BuPljaYdbSxsY+xMawbwpAFLwgHaeZYvzYkAWBdXL4eO2HfiCOxA7Pe7YTQLw==";
    };
    alexander-4 = {
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINAH+9iIQGZJA4C9xJeh3gZvGGy5vsAkvB5m4Fk01lT6";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCY/9Pvp1hwhWd9JJX6HiZmhDgHknEYKJv6NxoB2LmhG38oVa8pzzg3dBSGXSe0FVqRe0PJ0cqd7eMV7IjRDXgCpWKsAbL+zC+d9g7syINJiCAXu+EKu8PZWsSTtgocqkBWj53C6UW55W5EG9vuFP2QdW2Og+4WWjOu8V754m3icRnKCrVAupC8Ocr8pNEVchFZ2NXpqx90EdYtt8TUS4tVl+X0YlyzEs4TwlIQyJzLKcLKx8k7daqY9PlKAdgwBoXiDg4rBfozfETAL0elJmVgDOX7FRQVp2GkS0jjvLQivMu7rzrEp3q42X3HdE6Q76t5jhTrjNEQYqqjDGL8nu9HdGRpctvj9R2/KahdD8z3Iu9u0EmDdJxgzMtG0W7aZp8ViRa1lo3eTtwkV6H35iAFxjWb3h3ieF2208ojXtMh8U30EnxkZx4jKKwxIVWZWU61TmsN50NTB5bb4iHQoctbwA1pLVJKQhJ23vtUCsR4b04RkEOrwDW9C2aW0HaXgrRJhg/HXreWxl0rY+fkgWRjTjbEA20ByeZ2/qjEoe8eYgALsDoJnPqtRS/BWOt/jf/YRRxfetGkwsT+2nUxLT8Bnw/kF7L5hy3vG4SdkyyQCncJ3BuPljaYdbSxsY+xMawbwpAFLwgHaeZYvzYkAWBdXL4eO2HfiCOxA7Pe7YTQLw==";
    };
    alpha = {
      # TODO: Populate
    };
    bahamut = {};
    bismark = {};
    carbuncle = {
      #TODO: Populate
    };
    chocobo = {};
    cid = {};
    diabolos = {};
    gaia = {};
    garuda = {
      # TODO: Populate
    };
    hydaelyn = {
      # TODO: Populate
    };
    kefka = {};
    ifrit = {};
    lakshmi = {
      # TODO: Populate
    };
    leviathan = {};
    menphina = {
      # TODO: Populate
    };
    meteion = {
      # TODO: Populate
    };
    moogle = {
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHS4IvdFUykitxeSNaCLEzdlpw8n8Cj07cfjC3/P29kA";
    };
    morbol = {};
    nidhogg = {};
    odin = {};
    ozma = {};
    phoenix = {};
    ramuh = {};
    ravana = {};
    shiva = {
      # TODO: Populate
    };
    sophia = {};
    susano = {};
    titan = {};
    titania = {};
    ultima = {};
    ultros = {};
    zodiark = {
      ecdsa = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNc+H+S0ClRHv4A8ENxhgEujUOQVqM4cVYFQsej9nobtQvbyOhAJA1H/iQ2OwiiopNMNxsalueaeAR30JMr7izM=";
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMWm+yl1rR0kizfypnNCeqw9i3kRO1ORV2TZQ5dshOyQ";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvJbK+gKGF72Ghs0mS43d8+pXnpteGE73unOFhLG2qxKvoE8Xnz6mNKOzoPGoOcNztIWnAr6qyyuBKXXMEdgigZyyWckNgrEVFnfsNnMexNi/z3iGHIO6PfziJ0OgkBmCzdUv/HulUjtEeI/MsDrUjPMTCz0V3hSi5aarDZQrMJFKDjGO1RdCpaV6gOnaXDQ0bcqxHLs6tu6Y1m1VW/qXGbDCPNtfpzM7JPD4Ywo//eF3sdyKWF58qklnyvrqXeuRIstt2jk+W+AOzvZtO8ngHQMEwYJOkqUuxm+c8cjUzC5HkV8nU7GCesY1VRl7QBLSsSyD5sQp7mD3XJBmldFYdv8HwlivtrMxgZJVvL3k6WXOTFyJBV6vJfy+euzHg/M9oAceYu/wKCQH7elJ5em1XWidcm0qgxvS7ABukpDlpyPE4lwCaJEhdSDxKV/MwpbAl6YGIkNIuroAylBxhwzYYbvUGsqpZObFfzUIBDNNG6a0I0a5TQAuRNGeIVxpHank=";
    };
  };
}
