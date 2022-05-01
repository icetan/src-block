# src-block

Expand embedded shell commands in text files.

## Usage

Expand comments in `some.sh`:

```sh
#!/bin/bash

#:[echo "Comment generated $(date)"]:

echo Some sh..
```

Then use bash to open `some.sh` in read+write mode and update inplace:

```sh
{ SB_STYLE=sh src-block < some.sh; } 1<> some.sh
```
