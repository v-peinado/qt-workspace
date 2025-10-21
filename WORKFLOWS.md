# Workflows de Desarrollo con Qt

Guía comparativa de cómo realizar tareas comunes con diferentes herramientas.

---

## 1. Abrir un proyecto existente

### Qt Creator
```
File > Open File or Project...
Seleccionar CMakeLists.txt
Configure Project
```

### VSCode
```bash
code /ruta/al/proyecto
```

### Terminal
```bash
cd /ruta/al/proyecto
# Listo para editar con vim/nano
```

---

## 2. Compilar

### Qt Creator
```
Ctrl+B
```
**Ventajas:** Automático, muestra errores en panel

### Terminal
```bash
cd build
make
```
o
```bash
cd build
cmake --build .
```

### Script
```bash
../../scripts/build.sh
```

---

## 3. Ejecutar

### Qt Creator
```
Ctrl+R  (compila automáticamente si hay cambios)
```

### Terminal
```bash
./build/NombreApp
```

---

## 4. Compilar + Ejecutar (todo en uno)

### Qt Creator
```
Ctrl+R
```

### Terminal
```bash
cd build && make && ./NombreApp
```

### Alias útil (añadir a ~/.bashrc)
```bash
alias qtr='cd build && make && ./*'
```

---

## 5. Añadir nuevo archivo

### Qt Creator (automático)
```
1. Botón derecho en src/ > Add New...
2. Seleccionar C++ Class
3. Rellenar nombre y clase base
4. Finish
✓ CMakeLists.txt se actualiza automáticamente
```

### Manual
```bash
# Crear archivos
nano src/NuevaClase.cpp
nano include/project/NuevaClase.h

# Editar CMakeLists.txt
nano src/CMakeLists.txt
```

Añadir a `set(SOURCES`:
```cmake
NuevaClase.cpp
```

Reconfigurar:
```bash
cd build && cmake ..
```

**Qt Creator:** `Build > Run CMake`

---

## 6. Debugging

### Qt Creator (visual)
```
1. Click en número de línea → Breakpoint
2. F5 - Start Debugging
3. F10 - Step Over
4. F11 - Step Into
5. Variables visibles en panel derecho
```

**Ventajas específicas Qt:**
- Ver jerarquía de QObjects
- Inspeccionar señales/slots
- Preview de QImage/QPixmap

### Terminal (GDB)
```bash
cd build
gdb ./NombreApp

(gdb) break main.cpp:15
(gdb) run
(gdb) next
(gdb) print miVariable
(gdb) continue
(gdb) quit
```

### VSCode
```
F5 con launch.json configurado
```

---

## 7. Ver errores de compilación

### Qt Creator
```
Panel inferior > Issues
Click en error → salta a la línea
```

### Terminal
```bash
make 2>&1 | less
```

Para ver todo:
```bash
make VERBOSE=1
```

---

## 8. Buscar en archivos

### Qt Creator
```
Ctrl+Shift+F
```

### Terminal
```bash
grep -r "texto" src/
```

### VSCode
```
Ctrl+Shift+F
```

---

## 9. Renombrar símbolo

### Qt Creator
```
Cursor en símbolo > Ctrl+Shift+R
Escribe nuevo nombre > Enter
✓ Renombra en todos los archivos
```

### Manual
```bash
find . -type f -name "*.cpp" -o -name "*.h" | xargs sed -i 's/ViejoNombre/NuevoNombre/g'
```

---

## 10. Ir a definición

### Qt Creator
```
F2 sobre símbolo
o
Ctrl+Click
```

### VSCode
```
F12
o
Ctrl+Click
```

---

## 11. Formatear código

### Qt Creator
```
Seleccionar código > Ctrl+I
o
Tools > C++ > Format Selected Text
```

### Terminal (clang-format)
```bash
clang-format -i src/*.cpp include/**/*.h
```

---

## 12. Clean build

### Qt Creator
```
Build > Clean All
Build > Rebuild All
```

### Terminal
```bash
rm -rf build/*
cd build
cmake .. -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
make
```

---

## 13. Build Release

### Qt Creator
```
Panel izquierdo: cambiar de Debug a Release
Ctrl+B
```

### Terminal
```bash
mkdir build-release && cd build-release
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64
make
```

---

## Workflow híbrido
```
VSCode (código) + Qt Creator (UI/Debug)
```
