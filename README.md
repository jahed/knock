# knock

Given a host, looks up its port sequence and knocks on it.

## Usage

```
$ ./knock --help
NAME
  knock - a simple port knocker

SYNOPSIS
  ./knock <host>

DESCRIPTION
  Given a host, looks up its port sequence and knocks on it.

  Version:   v1.0.0
  Homepage:  https://github.com/jahed/knock
  Donate:    https://jahed.dev/donate

CONFIG
  You MUST place a config file under "~/.config/knock/hosts.json" with the
  following structure:

  {
    "example.com": [1000, 2000, 3000]
  }

  Such that executing:

    ./knock example.com

  Will knock on example.com at ports 1000 then 2000 then 3000.

OPTIONS
  <input_image>
    Image to convert into tiles. Must exist. Must be square, otherwise
    see --square option.

  <host>
    Target host. Where you want to knock.
    Must exist under ~/.config/knock/hosts.json

  -h, --help
    Prints this help message.

  --version
    Prints the version.

EXAMPLES
  Knock on example.com.
    ${0} example.com

DEPENDENCIES
  Required
    ncat    https://nmap.org/ncat/
    Bash    https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29

COPYRIGHT
  The MIT License (MIT)
  Copyright (c) 2020 Jahed Ahmed
```

## License

[MIT](LICENSE)
