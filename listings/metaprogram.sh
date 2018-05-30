#!/bin/bash
echo "#!/bin/bash" > program
for I in $(seq 1337)
do
  echo "echo $I" >> program
done
