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
      ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINtGHGqG4hcQwIkfqSAi7x1ZuV6vSLkoLToZVxSoSNHK";
      rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/whFPp1EGuuwljL+vzb9bF7ViX660UGZ/WiLUaK0f9S1GZj0fDpXwYBJVXY5lY3ssvwQn3RJkUzYPs2ru/0pG+BhmUq7q9ViTjnZYLv7UEhsbmC2m3iQJODI7Q7P76VGwlxMheM1FqpWsE3itEyNORgml25UiQs90fenepwa1MGiOIOrhjtRSNlX3MjCGJrSpXSHvB3bA5F7ay4zEaO3p6b4SkqTI7WjqOyMrm//dFNNq0eyztZR6IbMXk5NfjlU+V70/XAW9HfOct/PeWluPPVoSPJSIzFGRbs6eEWBayFiAdX5SXFb1WoD0C0lbGTVsctDEVBU5DFJZLRioGQE/3GAMdDeu2SZUPjjJoR3nm6cGax62mtecbipks3dre7Z53RhXK+peYhZYHJlxljX2079TuHCEj2P0Vtn/U0oHPdMoZ2UDTwH/7AoEnmqK8sOAqjVtDKlu3dn88KlF6luSTr0mZkEpoomKvVj5gGeV0QoJua9OzhoR3TgbpJa3+gGvF4xCaEuj69vVHnqlm6YADkNcmNg8nphuOk+U4imZM9gCJkQlA33+3Pd9qjjZ9uRNJwu6AegxtoQ2oICx59FKytY1SmF9zJB7Vy0VPdNBS8JkifZBjoxUpum/05xAZO7h3vz6Q7f9F10DlyZo9Lzt0JoNBaNAVZYARPMhsfMMOQ==";
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
