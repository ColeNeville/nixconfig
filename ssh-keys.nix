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
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGNOSDj2W72iucR9FWzcN0zkWbwiGr8h7wFmEC10eg03";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw1n9tCVJ2PuXApcTcdHIHQHEFh+Fut88GofzgpoXaKpLn47UUADrMqNdfpOK9FbnlXauxUeBiJWggNLKVZign8HyLRrVbPw8qDGmEkghM2/y4/IyLqH8xTv4tI3qCBtVpjIPR21OGb5o3YwzccaQNGQFrl4JaVMQTceNhmgR7UcUivg9bTiprwUbEJ6GmxkwnkYkY9f+RtO9xbqpOEdpb20oTydvMQAUfI6JUSMwQwilKo0YoIqhYk7ovXcdVg8lfOTDG0iPcQ96y+fDA5IDSEuB/GYKEyWnXu7cflDYW0mvD7pgOBcmwH5yEKoVODnaWNJECM+lr1mLLPwXivkU+VaCncL1qvquXvuBtjcc4WW0dj3tCxnnD8UA9R/UoJ+GlC+CMd3tnzSabJTQ/IE0jGTb09pS+M8EXJS+v95ej8tV8XKTpO6Gz3lGujs5M4yJIjQut4Y5+nd++KV/E4OihTojwcdeJl+JzzA1fUZB3NwIpnsl7jHuLiME3QWAQZGKOy79I7jgCxkz5V3PxbjcQDuMQo9M3cE0PztpH/+pDDXy4nsxfoxyZq2WLR0KuJf+yJxjbJnulC7fuY8/O4rmfIy0NmCzDjMVtWHckvJHsthtS2ncS81gGpeQ22zTJ70GdSnmsyMHIwJK1mMMbYstjiBkwBuMDi4siF3kQsgJXlw==";
    };
    alexander-2 = {
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILUwIzeONPPMsltQ0jnqazkAEBxdvK2K3YxhlXbEGll/";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDmYGoEs6TIcAn2Yk6QjTvbTOYYADYLzKP17XOT4dLlSmrGXI1DOC17+Yx1TWVKfcIxf7/6wJoR2PFLsGrfzbopkUXQw764frZHjXuOIKCd54re9zciVMHBtl7GiopX2nmzcxHK6hrH6ApB0Xv929VweDwnW1iYWT49OZ2Bq0ql6C53ZasZkGry28Nj7cmIc0OXaJIX3BSmH2ozITIEY8MKtvZsKFnNKHedudu/hapJFs7xQ1dL0MJXNpYDk395+Uk8TeENnp6bgJiCsucE4HDbSGae/Afaz0/opDepuxq7uga2PdQ1I5puKV8g0P0GcWKhyEl+23NpSm7KmCferxerKLQdUXr6KvGRtQz/6MjG/mxcIKl6GF4ZB1Upv/OWp2AQMqCNkZCF4vHHIUngq/AY+1mEOSXR0F01pKaECGSOF/3FS2x3ZCYygw11whvymxDfhE13/FGsT5fJXHP+g/lS6wrqCbo1FML1OCt4g91ODB+U5SwQRuOr4hVfSLJHCws9qypbe/V5u5hIdlTn26FMS27zwquJT8tLqhJzpTFzsv0S2oU/9c4qw/CISQsfB50wmqEDzdkfatDe7L8ABEnpsF/FOkQQyEz/PbYTXVxykkeSwM8F+/zqyxJmEIR6IyB+sIgrufBcylU1O+O1Qv2oYJnsgV81lup3m2pHhE5e7Q==";
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
