# Creation
Copying all the headers:
```sh
cd src/wrapper/all
cp /usr/include/vtk/*.h ./
```

Generating the bindings:
```sh
find ./ -name "*.h" -exec c2nim --header --cpp ../vtk.c2nim {} \;
```

This implies processing more than 3000 files so it takes many minutes.


# .c2nim
We can:
```
grep -h ^class *.h | sed  -n '/class\ VTK/p' | sed -e 's/^class\ \([A-Z_0-9]*\)\ .*$/#def\ \1/g'
```

Remove duplicated lines:
```
sort salida.txt | uniq > salida2.txt
```

# Processing all the files in parallel
We can do:
```
find ./ -name "*.h" -print0 | xargs -0 -P 8 -n 1 sh -c 'echo "Processing $0"; c2nim --header --cpp ../vtk.c2nim "$0"'
```
